//
//  LoginPatchViewController.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import SnapKit
import Then
import UIKit

final class LoginPatchViewController: UIViewController {

    // MARK: - Properties

    private var newNickname: String = ""
    private let userId: Double = UserManager.shared.userId ?? 1

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }

    // MARK: - Actions

    @objc private func textFieldDidChange(_ textField: UITextField) {
        newNickname = textField.text ?? ""
    }

    @objc private func fetchNicknameTap() {
        Task {
            do {
                let nickname = try await MyNickNameService.shared.fetchNickname(
                    userId: userId
                )
                infoLabel.text = "현재 닉네임: \(nickname)"
            } catch {
                infoLabel.text = "조회 실패: \(error.localizedDescription)"
            }
        }
    }

    @objc private func patchNicknameTap() {
        Task {
            guard let newValue = self.nicknameTextField.text, !newValue.isEmpty
            else {
                infoLabel.text = "닉네임을 입력해주세요"
                return
            }
            do {
                try await PatchNickNameService.shared.patchNickname(
                    userId: Double(userId),
                    newNickname: nicknameTextField.text ?? ""
                )
                infoLabel.text = "닉네임이 '\(newValue)'으로 변경되었습니다!"
            } catch {
                if let networkError = error as? NetworkError {
                    print("에러 설명: \(networkError.errorDescription)")
                } else {
                    print("알 수 없는 에러: \(error.localizedDescription)")
                }
                infoLabel.text = "변경 실패: \(error.localizedDescription)"
            }
        }
    }

    // MARK: - Layout

    private func setLayout() {
        view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerY.equalToSuperview()
        }

        [infoLabel, nicknameTextField, fetchButton, patchButton].forEach {
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints { $0.height.equalTo(44) }
        }
    }

    // MARK: - UI Components

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var infoLabel = UILabel().then {
        $0.text = "닉네임 정보가 여기에 표시됩니다"
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .center
    }

    private lazy var nicknameTextField = UITextField().then {
        $0.placeholder = "새 닉네임을 입력하세요"
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 8
        $0.setLeftPadding(12)
        $0.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged
        )
    }

    private lazy var fetchButton = UIButton().then {
        $0.setTitle("닉네임 조회", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.addTarget(
            self,
            action: #selector(fetchNicknameTap),
            for: .touchUpInside
        )
    }

    private lazy var patchButton = UIButton().then {
        $0.setTitle("닉네임 변경", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 8
        $0.addTarget(
            self,
            action: #selector(patchNicknameTap),
            for: .touchUpInside
        )
    }
}

// MARK: - Padding Extension

extension UITextField {
    fileprivate func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height)
        )
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
