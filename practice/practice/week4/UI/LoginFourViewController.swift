//
//  LoginFourViewController.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

import SnapKit
import SwiftUI
import Then
import UIKit

final class LoginFourViewController: UIViewController {

    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }

    @objc private func loginButtonTap() {
        Task {
            do {
                let response = try await LoginService.shared.postLoginData(
                    loginId: self.loginId,
                    password: self.password
                )
                UserManager.shared.userId = Double(response.userId)
                let alert = UIAlertController(
                    title: "로그인 성공",
                    message: "환영합니다!(userId: \(Int(response.userId)))",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)

            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
            }
        }
    }

    @objc private func nicknameButtonTap() {
        let loginPatchVC = LoginPatchViewController()
        self.present(loginPatchVC, animated: true)
    }

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }

    @objc private func registerButtonTap() {
        Task {
            do {
                let response = try await RegisterService.shared
                    .postRegisterData(
                        loginId: self.loginId,
                        password: self.password,
                        nickname: self.nickName
                    )
                let alert = UIAlertController(
                    title: "계정 생성 성공",
                    message:
                        "환영합니다, \(response.nickname)님 (ID: \(response.userId))",
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "계정 생성 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                print("회원가입 에러", error)
            }
        }
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerY.equalToSuperview()
        }

        let elements = [
            idTextField, passwordTextField, nickNameTextField, registerButton,
            infoViewButton, loginButton,nickNameButton
        ]

        elements.forEach {
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(44)
            }
        }
    }

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var idTextField = UITextField().then {
        $0.addTarget(
            self,
            action: #selector(textFieldDidEditing(_:)),
            for: .allEvents
        )
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }

    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(
            self,
            action: #selector(textFieldDidEditing(_:)),
            for: .allEvents
        )
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }

    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(
            self,
            action: #selector(textFieldDidEditing(_:)),
            for: .allEvents
        )
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
    }

    private lazy var registerButton = UIButton().then {
        $0.addTarget(
            self,
            action: #selector(registerButtonTap),
            for: .touchUpInside
        )
        $0.backgroundColor = .blue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
    }

    private lazy var infoViewButton = UIButton().then {
        $0.addTarget(
            self,
            action: #selector(infoViewButtonTap),
            for: .touchUpInside
        )
        $0.backgroundColor = .blue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
    }

    private lazy var loginButton = UIButton().then {
        $0.addTarget(
            self,
            action: #selector(loginButtonTap),
            for: .touchUpInside
        )
        $0.backgroundColor = .blue
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .white
    }

    private lazy var nickNameButton = UIButton().then {
        $0.addTarget(
            self,
            action: #selector(nicknameButtonTap),
            for: .touchUpInside
        )
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 관련 Task", for: .normal)
        $0.titleLabel?.textColor = .white
    }
}

struct PreviewProvider_MainViewController: PreviewProvider {
    static var previews: some View {
        LoginFourViewController().toPreview()
    }
}

#if DEBUG
    extension UIViewController {
        private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(
                _ uiViewController: UIViewController,
                context: Context
            ) {}
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
    }
#endif
