//
//  LoginPageUnlocked.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/14.
//

import UIKit

class LoginPageUnlockedView: UIViewController {
    
    private lazy var backgroundView: UIView = {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        mainView.backgroundColor = gyColor

        let leftSide = UIView(frame: CGRect(x: 0, y: 0, width: 368, height: UIScreen.main.bounds.height))
        leftSide.backgroundColor = priColor

        let imageLogo = UIImageView(frame: CGRect(x: 70, y: 246, width: 218, height: 276))
        imageLogo.image = UIImage(named: "Component 197 – 2")
        leftSide.addSubview(imageLogo)
        mainView.addSubview(leftSide)
        
        // Change the color and UI Elements

        let nameLogo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        let nameLabel = UILabel(frame: CGRect(x: 83, y: 20, width: 150, height: 26))

        let passwordLogo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        let passwordLabel = UILabel(frame: CGRect(x: 83, y: 20, width: 150, height: 26))

        nameLogo.image = UIImage(named: "Component 188 – 2")
        nameLabel.textColor = bkColor
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameLogo)
        nameView.addSubview(nameTextField)

        passwordLogo.image = UIImage(named: "Component 189 – 2")
        passwordLabel.textColor = bkColor
        passwordView.addSubview(passwordLabel)
        passwordView.addSubview(passwordLogo)
        passwordView.addSubview(passwordTextField)
        
        // Static labels are described here
        let titleLabel = UILabel(frame: CGRect(x: 424, y: 144, width: 544, height: 18))
        titleLabel.text = "請選擇您的身份"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = bkColor

        let dataLabel = UILabel(frame: CGRect(x: 424, y: 248, width: 544, height: 18))
        dataLabel.text = "請輸入帳密資料後登入系統"
        dataLabel.font = UIFont.systemFont(ofSize: 16)
        dataLabel.textColor = bkColor

        mainView.addSubview(titleLabel)
        mainView.addSubview(dataLabel)
        mainView.addSubview(nameView)
        mainView.addSubview(passwordView)
        return mainView
    }()

    private lazy var nameView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 272, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var passwordView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 360, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white
        return view
    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 26))
        nameTextField.textColor = bkColor
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.font = UIFont.systemFont(ofSize: 24)
        nameTextField.placeholder = "帳號"
        return nameTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 24))
        passwordTextField.textColor = bkColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = UIFont.systemFont(ofSize: 24)
        passwordTextField.placeholder = "密碼"
        return passwordTextField
    }()

    private lazy var adminButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 168, width: 288, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal)
        button.setTitle("我是系統/轄區管理員", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        return button
    }()

    private lazy var userButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 728, y: 168, width: 240, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal)
        button.setTitle("我是里長/里幹事", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func userButtonTapped() {
    }

    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 636, y: 592, width: 150, height: 28))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("忘記密碼？", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(bkColor, for: .normal)
        button.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func forgetPasswordButtonTapped() {
        
    }

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 496, width: 544, height: 72))
        button.backgroundColor = priColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonTapped() {
        
        if (nameTextField.text == "" || passwordTextField.text == ""){
            backgroundView.addSubview(warningLabel)
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = danColor.cgColor
            passwordView.layer.borderWidth = 1
            passwordView.layer.borderColor = danColor.cgColor

        } else if (nameTextField.text != "leo.1.nugraha@gmail.com" && passwordTextField.text != "asdf1234") {
            backgroundView.addSubview(warningLabel)
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = danColor.cgColor
            passwordView.layer.borderWidth = 1
            passwordView.layer.borderColor = danColor.cgColor

        } else {
            
            let otpEntryView = OTPEntryView()
            otpEntryView.modalPresentationStyle = .fullScreen
            self.present(otpEntryView, animated: false, completion: nil)
        }
    }

    private lazy var warningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 424, y: 432, width: 544, height: 40))
        label.backgroundColor = gyColor
        label.textColor = danColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(forgetPasswordButton)
        backgroundView.addSubview(loginButton)
        backgroundView.addSubview(userButton)
        backgroundView.addSubview(adminButton)
    }

}

