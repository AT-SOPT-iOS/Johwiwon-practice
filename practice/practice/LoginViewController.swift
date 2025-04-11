//
//  LoginViewController.swift
//  practice
//
//  Created by 조휘원 on 4/11/25.
//

import UIKit

class LoginViewController: UIViewController{
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 163, width: 236, height: 50))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 70, y: 163)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x:20,y:276,width:335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        
        let leftPadding = UIView(frame: CGRect(x : 0,y : 0,width : 23,height : 52))
        textField.leftView = leftPadding
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        let leftPadding = UIView(frame: CGRect(x : 0,y : 0,width : 23,height : 52))
        textField.leftView = leftPadding
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"Pretendard-SemiBold", size: 18)
        button.titleLabel?.textAlignment = .center
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func loginButtonDidTapped(){
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC(){
        let welcomViewController = WelcomViewController()
        self.navigationController?.pushViewController(welcomViewController, animated: true)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout(){
        [titleLabel,idTextField,passwordTextField,loginButton].forEach{
            self.view.addSubview($0)
        }
    }
}
