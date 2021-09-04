//
//  ChangePasswordView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class ChangePasswordView: UIViewController {

    private lazy var oldPasswordTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 504, height: 26))
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.placeholder = "請輸入目前密碼"
        textfield.textColor = bkColor
        textfield.backgroundColor = whiteColor
        textfield.isSecureTextEntry = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        return textfield
    }()

    private lazy var newPasswordTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 504, height: 26))
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.placeholder = "請輸入新密碼（8位以上包含半形英文+數字）"
        textfield.textColor = bkColor
        textfield.backgroundColor = whiteColor
        textfield.isSecureTextEntry = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        return textfield
    }()

    private lazy var confirmPasswordTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 504, height: 26))
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.placeholder = "請再次輸入新密碼"
        textfield.textColor = bkColor
        textfield.backgroundColor = whiteColor
        textfield.isSecureTextEntry = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        return textfield
    }()

    private lazy var topWarningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 33, y: 192, width: 536, height: 26))
        label.textColor = danColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private lazy var middleWarningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 33, y: 376, width: 536, height: 26))
        label.textColor = danColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private lazy var bottomWarningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 33, y: 536, width: 536, height: 26))
        label.textColor = danColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 212, y: 49, width: 600, height: 664))
        view.layer.cornerRadius = 16
        view.backgroundColor = whiteColor

        let title = UILabel(frame: CGRect(x: 33, y: 35, width: 150, height: 34))
        title.backgroundColor = whiteColor
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = priColor
        title.text = "修改密碼"

        let oldPwdLabel = UILabel(frame: CGRect(x: 33, y: 81, width: 100, height: 26))
        oldPwdLabel.backgroundColor = whiteColor
        oldPwdLabel.font = UIFont.systemFont(ofSize: 24)
        oldPwdLabel.textColor = bkColor
        oldPwdLabel.text = "舊密碼*"

        let horizontalBar = UILabel(frame: CGRect(x: 33, y: 240, width: 536, height: 2))
        horizontalBar.backgroundColor = bkColor

        let newPwdLabel = UILabel(frame: CGRect(x: 33, y: 264, width: 100, height: 26))
        newPwdLabel.backgroundColor = whiteColor
        newPwdLabel.font = UIFont.systemFont(ofSize: 24)
        newPwdLabel.textColor = bkColor
        newPwdLabel.text = "新密碼*"

        let confirmPwdLabel = UILabel(frame: CGRect(x: 33, y: 424, width: 200, height: 26))
        confirmPwdLabel.backgroundColor = whiteColor
        confirmPwdLabel.font = UIFont.systemFont(ofSize: 24)
        confirmPwdLabel.textColor = bkColor
        confirmPwdLabel.text = "確認新密碼*"

        let oldPasswordBox = UIView(frame: CGRect(x: 33, y: 120, width: 536, height: 56))
        oldPasswordBox.backgroundColor = whiteColor
        oldPasswordBox.layer.cornerRadius = 8
        oldPasswordBox.layer.borderWidth = 2
        oldPasswordBox.layer.borderColor = bkColor.cgColor

        let newPasswordBox = UIView(frame: CGRect(x: 33, y: 304, width: 536, height: 56))
        newPasswordBox.backgroundColor = whiteColor
        newPasswordBox.layer.cornerRadius = 8
        newPasswordBox.layer.borderWidth = 2
        newPasswordBox.layer.borderColor = bkColor.cgColor

        let confirmPasswordBox = UIView(frame: CGRect(x: 33, y: 465, width: 536, height: 56))
        confirmPasswordBox.backgroundColor = whiteColor
        confirmPasswordBox.layer.cornerRadius = 8
        confirmPasswordBox.layer.borderWidth = 2
        confirmPasswordBox.layer.borderColor = bkColor.cgColor

        view.addSubview(title)
        view.addSubview(exitButton)
        view.addSubview(oldPwdLabel)
        view.addSubview(oldPasswordBox)
        oldPasswordBox.addSubview(oldPasswordTextField)
        view.addSubview(horizontalBar)
        view.addSubview(newPwdLabel)
        view.addSubview(newPasswordBox)
        newPasswordBox.addSubview(newPasswordTextField)
        view.addSubview(confirmPwdLabel)
        view.addSubview(confirmPasswordBox)
        confirmPasswordBox.addSubview(confirmPasswordTextField)
        view.addSubview(proceedButton)
        return view
    }()

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 592, width: 600, height: 72))
        button.backgroundColor = priColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitle("送出", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func proceedButtonTapped() {
        // Perform old password check and two new password prompts check
        if oldPasswordTextField.text == "" || newPasswordTextField.text == "" || confirmPasswordTextField.text == "" {
            topWarningLabel.text = "密碼輸入錯誤！"
        } else if newPasswordTextField.text != confirmPasswordTextField.text {
            bottomWarningLabel.text = "密碼不一致，請重新輸入！"
        } else {
            let passwordChangedAlertSuccessful = PasswordChangedAlertSuccessful()
            passwordChangedAlertSuccessful.modalPresentationStyle = .fullScreen
            present(passwordChangedAlertSuccessful, animated: false, completion: nil)
        }

    }

    private lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 529, y: 32, width: 40, height: 40))
        button.backgroundColor = whiteColor
        button.setImage(UIImage(named: "common_cancel"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func exitButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 600),
            backgroundView.heightAnchor.constraint(equalToConstant: 664)
        ])
    }

}
