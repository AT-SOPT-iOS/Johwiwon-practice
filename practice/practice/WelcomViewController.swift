//
//  Untitled.swift
//  practice
//
//  Created by 조휘원 on 4/11/25.
//

import UIKit

class WelcomViewController: UIViewController {
    var id: String? = ""

    private let imageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(x: 113, y: 87, width: 150, height: 150)
        )
        imageView.image = UIImage(named: "ic_carrot")
        return imageView
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(x: 140, y: 295, width: 95, height: 60)
        )
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-SemiBold", size: 25) ?? .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private lazy var goToMainButton: UIButton = {
        let button = UIButton(
            frame: CGRect(x: 20, y: 426, width: 335, height: 57)
        )
        button.backgroundColor = UIColor(
            red: 255 / 255,
            green: 111 / 255,
            blue: 15 / 255,
            alpha: 1
        )
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 18)  ?? .systemFont(ofSize: 18, weight: .semibold)
        button.titleLabel?.textAlignment = .center
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
                button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()

    private lazy var goToLoginButton: UIButton = {
        let button = UIButton(
            frame: CGRect(x: 20, y: 498, width: 335, height: 57)
        )
        button.backgroundColor = UIColor(
            red: 221 / 255,
            green: 222 / 255,
            blue: 227 / 255,
            alpha: 1
        )
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(
            UIColor(
                red: 182 / 255,
                green: 172 / 255,
                blue: 185 / 255,
                alpha: 1
            ),
            for: .normal
        )
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 18)  ?? .systemFont(ofSize: 18, weight: .semibold)
        button.titleLabel?.textAlignment = .center
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
                button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()

    private func bindID() {
        if let name = id{
            self.welcomeLabel.text = "\(name)님 \n반가워요!"
        }
    }

    func setLabelText(id: String?) {
        self.id = id
    }

    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    private func setLayout() {
        [imageView, welcomeLabel, goToMainButton, goToLoginButton]
            .forEach {
                self.view.addSubview($0)
            }
    }
}
