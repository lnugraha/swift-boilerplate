//
//  ViewController.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import UIKit

// MARK: This section acts as a login page to retrieve login credential (access_token)
class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 28))
        label.text = "AisleConnect"
        label.textColor = blColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26)
        return label
    }()

    private lazy var usernameView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = bkColor.cgColor
        return view
    }()

    private lazy var usernameTextField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 194, height: 24))
        field.backgroundColor = UIColor.red
        let placeholderStr = NSAttributedString(string:"請輸入帳號", attributes: [NSAttributedString.Key.foregroundColor: bkColor])
        field.attributedPlaceholder = placeholderStr
        field.backgroundColor = UIColor.white
        field.textColor = bkColor
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        usernameView.addSubview(field)
        return field
    }()

    private lazy var passwordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = bkColor.cgColor
        return view
    }()

    private lazy var passwordTextField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 24))
        field.backgroundColor = UIColor.red
        let placeholderStr = NSAttributedString(string:"請輸入密碼", attributes: [NSAttributedString.Key.foregroundColor: bkColor])
        field.attributedPlaceholder = placeholderStr
        field.backgroundColor = UIColor.white
        field.textColor = bkColor
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.isSecureTextEntry = true
        return field
    }()

    private lazy var warningMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 26))
        label.backgroundColor = gyColor
        label.textColor = redColor
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private lazy var loginButtton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        button.backgroundColor = bkColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("登入", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonTapped() {
        if (usernameTextField.text == "" || passwordTextField.text == ""){
            // print an error message
            warningMessage.text = "帳號或密碼不能空間"
            usernameView.layer.borderColor = redColor.cgColor
            passwordView.layer.borderColor = redColor.cgColor
        } else {
            print("DEBUG: \(#function) \(#line)")
            let access_token = APIHandler.postLoginCredentials(username: usernameTextField.text!, password: passwordTextField.text!)
            GlobalDataAccess.shared.access_token = access_token
            if access_token != "" {
                // proceed to the next view controller (navigation controller)
                print("DEBUG: Access Token \(String(describing: GlobalDataAccess.shared.access_token))")
                let mainPageView = MainPageView()
                mainPageView.modalPresentationStyle = .fullScreen
                present(mainPageView, animated: false, completion: nil)
            } else {
                // print an error message
                warningMessage.text = "帳號或密碼無效，請重新輸入！"
                usernameView.layer.borderColor = redColor.cgColor
                passwordView.layer.borderColor = redColor.cgColor
            } // end-if access_token

        } // end-if

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Dismiss keyboard when tapping any part of the screen
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        self.view.backgroundColor = gyColor
        self.view.addSubview(titleLabel)
        self.view.addSubview(usernameView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordView)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(warningMessage)
        self.view.addSubview(loginButtton)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])

        usernameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            usernameView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            usernameView.widthAnchor.constraint(equalToConstant: 300),
            usernameView.heightAnchor.constraint(equalToConstant: 60)
        ])

        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: usernameView.topAnchor, constant: 16),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameView.leadingAnchor, constant: 16),
            usernameTextField.widthAnchor.constraint(equalToConstant: 268),
            usernameTextField.heightAnchor.constraint(equalToConstant: 28)
        ])

        passwordView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: 20),
            passwordView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordView.widthAnchor.constraint(equalToConstant: 300),
            passwordView.heightAnchor.constraint(equalToConstant: 60)
        ])

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 16),
            passwordTextField.widthAnchor.constraint(equalToConstant: 268),
            passwordTextField.heightAnchor.constraint(equalToConstant: 28)
        ])

        warningMessage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            warningMessage.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 20),
            warningMessage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            warningMessage.widthAnchor.constraint(equalToConstant: 300),
            warningMessage.heightAnchor.constraint(equalToConstant: 30)
        ])

        loginButtton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButtton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButtton.topAnchor.constraint(equalTo: warningMessage.bottomAnchor, constant: 20),
            loginButtton.widthAnchor.constraint(equalToConstant: 300),
            loginButtton.heightAnchor.constraint(equalToConstant: 60)
        ])

    }

}
