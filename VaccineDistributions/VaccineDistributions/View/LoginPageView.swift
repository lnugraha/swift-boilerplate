//
//  ViewController.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import UIKit

protocol selectAccountButton {
    func getUserButton() -> UIButton
}

class LoginPageView: UIViewController {

    fileprivate lazy var backgroundView: UIView = {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        mainView.backgroundColor = gyColor

        let leftSide = UIView(frame: CGRect(x: 0, y: 0, width: 368, height: UIScreen.main.bounds.height))
        leftSide.backgroundColor = priColor

        let imageLogo = UIImageView(frame: CGRect(x: 70, y: 246, width: 218, height: 276))
        imageLogo.image = UIImage(named: "Component 197 – 2")

        leftSide.addSubview(imageLogo)
        mainView.addSubview(leftSide)

        let titleLabel = UILabel(frame: CGRect(x: 424, y: 104, width: 544, height: 18))
        titleLabel.text = "請選擇您的身份"
        titleLabel.font = UIFont.systemFont(ofSize: mainView.frame.height / CGFloat(ABSOLUTE_HEIGHT) * 16)
        titleLabel.textColor = bkColor

        let dataLabel = UILabel(frame: CGRect(x: 424, y: 208, width: 544, height: 18))
        dataLabel.text = "請輸入帳密資料後登入系統"
        dataLabel.font = UIFont.systemFont(ofSize: mainView.frame.height / CGFloat(ABSOLUTE_HEIGHT) * 16)
        dataLabel.textColor = bkColor

        mainView.addSubview(titleLabel)
        mainView.addSubview(dataLabel)

        leftSide.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftSide.topAnchor.constraint(equalTo: mainView.topAnchor),
            leftSide.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            leftSide.heightAnchor.constraint(equalToConstant: FULL_HEIGHT),
            leftSide.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 368/CGFloat(ABSOLUTE_WIDTH)),

            imageLogo.centerXAnchor.constraint(equalTo: leftSide.centerXAnchor),
            imageLogo.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            imageLogo.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 276/CGFloat(ABSOLUTE_HEIGHT)),
            imageLogo.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 218/CGFloat(ABSOLUTE_WIDTH)),

            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 144*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            titleLabel.widthAnchor.constraint(equalToConstant: 544),

            dataLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 248*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            dataLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            dataLabel.heightAnchor.constraint(equalToConstant: 18),
            dataLabel.widthAnchor.constraint(equalToConstant: 544),
        ])

        return mainView
    }()

    @objc func adminButtonTapped(sender: UIButton?) {
         let loginPageAdmin = LoginPageViewAdminUnlocked()
         loginPageAdmin.modalPresentationStyle = .fullScreen
         self.present(loginPageAdmin, animated: false, completion: nil)
    }

    @objc func userButtonTapped(sender: UIButton?) {
        let loginPageUnlocked = LoginPageViewUnlocked()
        loginPageUnlocked.modalPresentationStyle = .fullScreen
        self.present(loginPageUnlocked, animated: false, completion: nil)
    }

    fileprivate lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 636, y: 592, width: 150, height: 28))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("忘記密碼？", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.setTitleColor(bkColor, for: .normal)
        button.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func forgetPasswordButtonTapped() {
        let forgetPasswordView = EnterAccountView()
        forgetPasswordView.modalPresentationStyle = .fullScreen
        present(forgetPasswordView, animated: false, completion: nil)
    }

    fileprivate lazy var warningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 424, y: 392, width: 544, height: 40))
        label.backgroundColor = gyColor
        label.textColor = danColor
        label.font = UIFont.systemFont(ofSize: 16*TEXT_SCALING_FACTOR)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "" // "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(forgetPasswordButton)
        backgroundView.addSubview(warningLabel)

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgetPasswordButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 592*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            forgetPasswordButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 636*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            forgetPasswordButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 28/CGFloat(ABSOLUTE_HEIGHT)),
            forgetPasswordButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 150/CGFloat(ABSOLUTE_WIDTH)),

            warningLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 432*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            warningLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            warningLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 40/CGFloat(ABSOLUTE_HEIGHT)),
            warningLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH))
        ])
    }

}

// MARK: The very first page to visit when everything is still in locked state
class LoginPageViewLocked: LoginPageView {

    func getUserButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 728, y: 128, width: 240, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal) // If checked inside: Component 126 - 5
        button.setImage(UIImage(named: "Component 126 - 5"), for: .selected)
        button.setTitle("我是里長/里幹事", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
        return button
    }

    func getAdminButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 424, y: 128, width: 288, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal) // If checked inside: Component 126 - 5
        button.setImage(UIImage(named: "Component 126 - 5"), for: .selected)
        button.setTitle("我是系統/轄區管理員", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
        return button
    }

    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 496, width: 544, height: 72))
        button.backgroundColor = bk_4Color
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonTapped() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        let nameView: UIView = getNameViewLocked()
        backgroundView.addSubview(nameView)
        let passwordView: UIView = getPasswordViewLocked()
        backgroundView.addSubview(passwordView)

        nameView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 272*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            nameView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            passwordView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 360*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            passwordView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),
        ])

        let userButton = getUserButton()
        let adminButton = getAdminButton()

        backgroundView.addSubview(loginButton)
        backgroundView.addSubview(userButton)
        backgroundView.addSubview(adminButton)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.translatesAutoresizingMaskIntoConstraints = false
        adminButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 496*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            loginButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 72/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            userButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 728*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            userButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 240/CGFloat(ABSOLUTE_WIDTH)),
            
            adminButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            adminButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 288/CGFloat(ABSOLUTE_WIDTH)),
        ])

    }
}

// MARK: Go to this page when the user button has been pressed
class LoginPageViewUnlocked: LoginPageView {

    private lazy var nameView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 232, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white

        let logo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        logo.image = UIImage(named: "Component 188 – 2")

        view.addSubview(logo)
        view.addSubview(nameTextField)

        logo.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            logo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            logo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),

            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 35),
            nameTextField.heightAnchor.constraint(equalToConstant: 26*TEXT_SCALING_FACTOR),
            nameTextField.widthAnchor.constraint(equalToConstant: 560),
        ])

        return view
    }()

    private lazy var passwordView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 320, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white

        let logo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        logo.image = UIImage(named: "Component 189 – 2")

        view.addSubview(logo)
        view.addSubview(passwordTextField)

        logo.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            logo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            logo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),

            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 24*TEXT_SCALING_FACTOR),
            passwordTextField.widthAnchor.constraint(equalToConstant: 560),
        ])

        return view
    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 24))
        nameTextField.textColor = bkColor
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        nameTextField.placeholder = "帳號"
        return nameTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 24))
        passwordTextField.textColor = bkColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        passwordTextField.placeholder = "密碼"
        return passwordTextField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 496, width: 544, height: 72))
        button.backgroundColor = priColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonTapped() {

        if (nameTextField.text == "" || passwordTextField.text == ""){
            warningLabel.text = "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = danColor.cgColor
            passwordView.layer.borderWidth = 1
            passwordView.layer.borderColor = danColor.cgColor

        } else if (nameTextField.text != "leo.1.nugraha@gmail.com" && passwordTextField.text != "asdf1234") {
            warningLabel.text = "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
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

    fileprivate lazy var adminButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 128, width: 288, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal)
        button.setImage(UIImage(named: "Component 126 – 5"), for: .selected)
        button.setTitle("我是系統/轄區管理員", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(adminButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()

    func getUserButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 728, y: 128, width: 240, height: 48))
        button.backgroundColor = priColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 126 – 15"), for: .normal)
        button.setTitle("我是里長/里幹事", for: .normal)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(userButtonTapped(sender:)), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.addSubview(nameView)
        let userButton = getUserButton()
        backgroundView.addSubview(passwordView)
        backgroundView.addSubview(loginButton)
        backgroundView.addSubview(userButton)
        backgroundView.addSubview(adminButton)

        nameView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 272*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            nameView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            passwordView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 360*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            passwordView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),
        ])

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.translatesAutoresizingMaskIntoConstraints = false
        adminButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 496*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            loginButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 72/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            userButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 728*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            userButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 240/CGFloat(ABSOLUTE_WIDTH)),
            
            adminButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            adminButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 288/CGFloat(ABSOLUTE_WIDTH)),
        ])

    }

}

// MARK: Go to this page when the user button has been pressed
class LoginPageViewAdminUnlocked: LoginPageView {

    private lazy var nameView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 232, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white

        let logo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        logo.image = UIImage(named: "Component 188 – 2")

        view.addSubview(logo)
        view.addSubview(nameTextField)

        logo.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            logo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            logo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),

            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 35),
            nameTextField.heightAnchor.constraint(equalToConstant: 24*TEXT_SCALING_FACTOR),
            nameTextField.widthAnchor.constraint(equalToConstant: 560),
        ])

        return view
    }()

    private lazy var passwordView: UIView = {
        let view = UIView(frame: CGRect(x: 424, y: 320, width: 544, height: 64))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white

        let logo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        logo.image = UIImage(named: "Component 189 – 2")

        view.addSubview(logo)
        view.addSubview(passwordTextField)

        logo.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            logo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            logo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),

            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 26*TEXT_SCALING_FACTOR),
            passwordTextField.widthAnchor.constraint(equalToConstant: 560),
        ])
        
        return view
    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 24))
        nameTextField.textColor = bkColor
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        nameTextField.placeholder = "帳號"
        return nameTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 83, y: 20, width: 560, height: 24))
        passwordTextField.textColor = bkColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        passwordTextField.placeholder = "密碼"
        return passwordTextField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 424, y: 496, width: 544, height: 72))
        button.backgroundColor = priColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonTapped() {

        if (nameTextField.text == "" || passwordTextField.text == ""){
            warningLabel.text = "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = danColor.cgColor
            passwordView.layer.borderWidth = 1
            passwordView.layer.borderColor = danColor.cgColor

        } else if (nameTextField.text != "leo.1.nugraha@gmail.com" && passwordTextField.text != "asdf1234") {
            warningLabel.text = "帳號或密碼輸入錯誤！\n請注意，錯誤超過3次，本帳號將暫時停用！"
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

    fileprivate lazy var userButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 728, y: 128, width: 240, height: 48))
        button.backgroundColor = gyColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 125 – 3"), for: .normal)
        button.setImage(UIImage(named: "Component 126 – 5"), for: .selected)
        button.setTitle("我是里長/里幹事", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(userButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()

    func getAdminButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 424, y: 128, width: 288, height: 48))
        button.backgroundColor = priColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = priColor.cgColor
        button.setImage(UIImage(named: "Component 126 – 15"), for: .normal)
        button.setTitle("我是系統/轄區管理員", for: .normal)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        button.addTarget(self, action: #selector(adminButtonTapped), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.addSubview(nameView)
        backgroundView.addSubview(passwordView)

        nameView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 272*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            nameView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            nameView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            passwordView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 360*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            passwordView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 64/CGFloat(ABSOLUTE_HEIGHT)),
            passwordView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),
        ])

        let adminButton = getAdminButton()
        backgroundView.addSubview(loginButton)
        backgroundView.addSubview(userButton)
        backgroundView.addSubview(adminButton)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.translatesAutoresizingMaskIntoConstraints = false
        adminButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 496*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            loginButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 72/CGFloat(ABSOLUTE_HEIGHT)),
            loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 544/CGFloat(ABSOLUTE_WIDTH)),

            userButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 728*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            userButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            userButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 240/CGFloat(ABSOLUTE_WIDTH)),

            adminButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 168*CGFloat(FULL_HEIGHT)/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 424*CGFloat(FULL_WIDTH)/CGFloat(ABSOLUTE_WIDTH)),
            adminButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 48/CGFloat(ABSOLUTE_HEIGHT)),
            adminButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 288/CGFloat(ABSOLUTE_WIDTH)),
        ])

    }

}

extension LoginPageView {

    func getNameViewLocked() -> UIView {
        let nameView = UIView(frame: CGRect(x: 424, y: 272, width: 544, height: 64))
        let nameLogo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        let nameLabel = UILabel(frame: CGRect(x: 83, y: 20, width: 150, height: 26))

        nameView.layer.cornerRadius = 8
        nameView.clipsToBounds = true
        nameView.backgroundColor = bk_1Color

        nameLabel.text = "帳號"
        nameLabel.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        nameLabel.textColor = bkColor
        nameLabel.textColor = bkColor
        nameLogo.image = UIImage(named: "Component 198 – 1")

        nameView.addSubview(nameLogo)
        nameView.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLogo.centerYAnchor.constraint(equalTo: nameView.centerYAnchor),
            nameLogo.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            nameLogo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            nameLogo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            
            nameLabel.centerYAnchor.constraint(equalTo: nameView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameLogo.trailingAnchor, constant: 35),
            nameLabel.heightAnchor.constraint(equalToConstant: 24*TEXT_SCALING_FACTOR),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
        ])

        return nameView
    }

    func getPasswordViewLocked() -> UIView {
        let passwordView = UIView(frame: CGRect(x: 424, y: 360, width: 544, height: 64))
        let passwordLogo = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        let passwordLabel = UILabel(frame: CGRect(x: 83, y: 20, width: 150, height: 26))

        passwordView.layer.cornerRadius = 8
        passwordView.clipsToBounds = true
        passwordView.backgroundColor = bk_1Color
        
        passwordLabel.text = "密碼"
        passwordLabel.font = UIFont.systemFont(ofSize: 24*TEXT_SCALING_FACTOR)
        passwordLabel.textColor = bkColor
        passwordLogo.image = UIImage(named: "Component 200 – 1")

        passwordView.addSubview(passwordLabel)
        passwordView.addSubview(passwordLogo)

        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLogo.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordLogo.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 16/CGFloat(544)*CGFloat(ABSOLUTE_WIDTH)),
            passwordLogo.heightAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            passwordLogo.widthAnchor.constraint(equalToConstant:32*TEXT_SCALING_FACTOR),
            
            passwordLabel.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordLogo.trailingAnchor, constant: 35),
            passwordLabel.heightAnchor.constraint(equalToConstant: 24*TEXT_SCALING_FACTOR),
            passwordLabel.widthAnchor.constraint(equalToConstant: 150),
        ])

        return passwordView
    }
    
}
