//
//  ForgetPasswordView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class ForgetPasswordView: UIViewController {
    
    fileprivate lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 204, y: 52, width: 616, height: 664))
        view.backgroundColor = whiteColor
        view.layer.cornerRadius = 16

        let label = UILabel(frame: CGRect(x: 32, y: 36, width: 300, height: 34))
        label.text = "忘記密碼"
        label.backgroundColor = whiteColor
        label.textColor = priColor
        label.font = UIFont.boldSystemFont(ofSize: 32)

        view.addSubview(label)
        view.addSubview(exitButton)
        view.addSubview(textBoxView)
        return view
    }()
    
    fileprivate lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 552, y: 32, width: 32, height: 32))
        button.setImage(UIImage(named: "common_cancel"), for: .normal)
        button.backgroundColor = whiteColor
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func exitButtonTapped() {
        let loginPageViewLocked = LoginPageViewLocked()
        loginPageViewLocked.modalPresentationStyle = .fullScreen
        present(loginPageViewLocked, animated: false, completion: nil)
    }
    
    fileprivate func setTitle(x: Int=32, y: Int=264, titleName: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y, width: 552, height: 26))
        label.backgroundColor = whiteColor
        label.textColor = UIColor.black
        label.text = titleName
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }
    
    fileprivate lazy var textBoxView: UIView = {
        let view = UIView(frame: CGRect(x: 32, y: 304, width: 552, height: 56))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = edgeColor.cgColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50),
            backgroundView.widthAnchor.constraint(equalToConstant: 616),
            backgroundView.heightAnchor.constraint(equalToConstant: 664)
        ])
    }

}

class EnterAccountView: ForgetPasswordView {

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 592, width: 616, height: 72))
        button.backgroundColor = priColor
        button.setTitle("下一步", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleLabel?.textColor = whiteColor
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func proceedButtonTapped() {
        let enterOTPView = EnterOTPView()
        enterOTPView.modalPresentationStyle = .fullScreen
        present(enterOTPView, animated: false, completion: nil)
    }

    private lazy var schematicDiagram: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 96, width: 616, height: 100))
        let circle_01 = UIImageView(frame: CGRect(x: 48, y: 0, width: 64, height: 64))
        circle_01.image = UIImage(systemName: "1.circle.fill")
        circle_01.tintColor = priColor
        
        let title_01 = UILabel(frame: CGRect(x: 32, y: 65, width: 150, height: 26))
        title_01.backgroundColor = UIColor.white
        title_01.textColor = priColor
        title_01.text = "驗證身分"
        title_01.font = title_01.font.withSize(24.0)
        
        let circle_02 = UIImageView(frame: CGRect(x: 276, y: 0, width: 64, height: 64))
        circle_02.image = UIImage(systemName: "2.circle.fill")
        circle_02.tintColor = bk_4Color
        
        let title_02 = UILabel(frame: CGRect(x: 248, y: 65, width: 150, height: 26))
        title_02.backgroundColor = UIColor.white
        title_02.textColor = bk_4Color
        title_02.text = "輸入驗證碼"
        title_02.font = title_01.font.withSize(24.0)
        
        let circle_03 = UIImageView(frame: CGRect(x: 504, y: 0, width: 64, height: 64))
        circle_03.image = UIImage(systemName: "3.circle.fill")
        circle_03.tintColor = bk_4Color
        
        let title_03 = UILabel(frame: CGRect(x: 488, y: 65, width: 100, height: 26))
        title_03.backgroundColor = UIColor.white
        title_03.textColor = bk_4Color
        title_03.text = "重設密碼"
        title_03.font = title_01.font.withSize(24.0)
        
        let pipeLeft = UILabel(frame: CGRect(x: 108, y: 34, width: 172, height: 2))
        pipeLeft.backgroundColor = bk_4Color
        
        let pipeRight = UILabel(frame: CGRect(x: 336, y: 34, width: 172, height: 2))
        pipeRight.backgroundColor = bk_4Color
        
        view.addSubview(pipeLeft)
        view.addSubview(pipeRight)
        view.addSubview(circle_01)
        view.addSubview(circle_02)
        view.addSubview(circle_03)
        view.addSubview(title_01)
        view.addSubview(title_02)
        view.addSubview(title_03)
        return view
    }()

    private lazy var mainTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 32, y: 216, width: 552, height: 26))
        label.backgroundColor = whiteColor
        label.textColor = bkColor
        label.text = "請輸入6位數驗證碼以完成身份確認 (240s)"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 520, height: 26))
        textfield.textColor = bkColor
        textfield.placeholder = "請輸入帳號"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleUsername = setTitle(x: 32, y: 264, titleName: "帳號*")
        textBoxView.addSubview(textField)
        backgroundView.addSubview(titleUsername)
        backgroundView.addSubview(schematicDiagram)
        backgroundView.addSubview(mainTitle)
        backgroundView.addSubview(proceedButton)
        
    }
}

class EnterOTPView: ForgetPasswordView {
    
    // Resend OTP Button
    private lazy var resendButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 592, width: 308, height: 72))
        button.backgroundColor = bkColor
        button.setTitle("重新傳送驗證碼", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleLabel?.textColor = whiteColor
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        button.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func resendButtonTapped() {
        
    }

    // Proceed Button
    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 308, y: 592, width: 308, height: 72))
        button.backgroundColor = priColor
        button.setTitle("下一步", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleLabel?.textColor = whiteColor
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func proceedButtonTapped() {
        let newPasswordView = NewPasswordView()
        newPasswordView.modalPresentationStyle = .fullScreen
        present(newPasswordView, animated: false, completion: nil)
    }
    
    private lazy var schematicDiagram: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 96, width: 616, height: 100))
        let circle_01 = UIImageView(frame: CGRect(x: 48, y: 0, width: 64, height: 64))
        circle_01.image = UIImage(systemName: "1.circle.fill")
        circle_01.tintColor = pri_7Color
        
        let title_01 = UILabel(frame: CGRect(x: 32, y: 65, width: 150, height: 26))
        title_01.backgroundColor = UIColor.white
        title_01.textColor = pri_7Color
        title_01.text = "驗證身分"
        title_01.font = title_01.font.withSize(24.0)
        
        let circle_02 = UIImageView(frame: CGRect(x: 276, y: 0, width: 64, height: 64))
        circle_02.image = UIImage(systemName: "2.circle.fill")
        circle_02.tintColor = priColor
        
        let title_02 = UILabel(frame: CGRect(x: 248, y: 65, width: 150, height: 26))
        title_02.backgroundColor = UIColor.white
        title_02.textColor = priColor
        title_02.text = "輸入驗證碼"
        title_02.font = title_01.font.withSize(24.0)
        
        let circle_03 = UIImageView(frame: CGRect(x: 504, y: 0, width: 64, height: 64))
        circle_03.image = UIImage(systemName: "3.circle.fill")
        circle_03.tintColor = bk_4Color
        
        let title_03 = UILabel(frame: CGRect(x: 488, y: 65, width: 100, height: 26))
        title_03.backgroundColor = UIColor.white
        title_03.textColor = bk_4Color
        title_03.text = "重設密碼"
        title_03.font = title_01.font.withSize(24.0)
        
        let pipeLeft = UILabel(frame: CGRect(x: 108, y: 34, width: 172, height: 2))
        pipeLeft.backgroundColor = pri_7Color
        
        let pipeRight = UILabel(frame: CGRect(x: 336, y: 34, width: 172, height: 2))
        pipeRight.backgroundColor = bk_4Color
        
        view.addSubview(pipeLeft)
        view.addSubview(pipeRight)
        view.addSubview(circle_01)
        view.addSubview(circle_02)
        view.addSubview(circle_03)
        view.addSubview(title_01)
        view.addSubview(title_02)
        view.addSubview(title_03)
        return view
    }()

    private lazy var mainTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 32, y: 216, width: 552, height: 26))
        label.backgroundColor = whiteColor
        label.textColor = bkColor
        label.text = "請輸入6位數驗證碼以完成身份確認 (240s)"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private lazy var textField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 520, height: 26))
        textfield.textColor = bkColor
        textfield.placeholder = "請輸入驗證碼"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        return textfield
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleUsername = setTitle(x: 32, y: 264, titleName: "驗證碼*")
        textBoxView.addSubview(textField)
        backgroundView.addSubview(titleUsername)
        backgroundView.addSubview(schematicDiagram)
        backgroundView.addSubview(mainTitle)
        backgroundView.addSubview(proceedButton)
        backgroundView.addSubview(resendButton)

    }
}

class NewPasswordView: ForgetPasswordView {

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 592, width: 616, height: 72))
        button.backgroundColor = priColor
        button.setTitle("送出", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleLabel?.textColor = whiteColor
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func proceedButtonTapped() {
        // SuccessChangePasswordView
        let successChangePasswordView = SuccessChangePasswordVC()
        successChangePasswordView.modalPresentationStyle = .fullScreen
        present(successChangePasswordView, animated: false, completion: nil)
    }

    private lazy var newPasswordTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 520, height: 26))
        textfield.textColor = bkColor
        textfield.placeholder = "請輸入新密碼"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        textfield.isSecureTextEntry = true
        return textfield
    }()

    private lazy var anotherTextBoxView: UIView = {
        let view = UIView(frame: CGRect(x: 32, y: 464, width: 552, height: 56))
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = edgeColor.cgColor
        return view
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 16, y: 16, width: 520, height: 26))
        textfield.textColor = bkColor
        textfield.placeholder = "請再次輸入新密碼"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private lazy var schematicDiagram: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 96, width: 616, height: 100))
        let circle_01 = UIImageView(frame: CGRect(x: 48, y: 0, width: 64, height: 64))
        circle_01.image = UIImage(systemName: "1.circle.fill")
        circle_01.tintColor = pri_7Color
        
        let title_01 = UILabel(frame: CGRect(x: 32, y: 65, width: 150, height: 26))
        title_01.backgroundColor = UIColor.white
        title_01.textColor = pri_7Color
        title_01.text = "驗證身分"
        title_01.font = title_01.font.withSize(24.0)
        
        let circle_02 = UIImageView(frame: CGRect(x: 276, y: 0, width: 64, height: 64))
        circle_02.image = UIImage(systemName: "2.circle.fill")
        circle_02.tintColor = pri_7Color
        
        let title_02 = UILabel(frame: CGRect(x: 248, y: 65, width: 150, height: 26))
        title_02.backgroundColor = UIColor.white
        title_02.textColor = pri_7Color
        title_02.text = "輸入驗證碼"
        title_02.font = title_01.font.withSize(24.0)
        
        let circle_03 = UIImageView(frame: CGRect(x: 504, y: 0, width: 64, height: 64))
        circle_03.image = UIImage(systemName: "3.circle.fill")
        circle_03.tintColor = priColor
        
        let title_03 = UILabel(frame: CGRect(x: 488, y: 65, width: 100, height: 26))
        title_03.backgroundColor = UIColor.white
        title_03.textColor = priColor
        title_03.text = "重設密碼"
        title_03.font = title_01.font.withSize(24.0)
        
        let pipeLeft = UILabel(frame: CGRect(x: 108, y: 34, width: 172, height: 2))
        pipeLeft.backgroundColor = pri_7Color
        
        let pipeRight = UILabel(frame: CGRect(x: 336, y: 34, width: 172, height: 2))
        pipeRight.backgroundColor = pri_7Color
        
        view.addSubview(pipeLeft)
        view.addSubview(pipeRight)
        view.addSubview(circle_01)
        view.addSubview(circle_02)
        view.addSubview(circle_03)
        view.addSubview(title_01)
        view.addSubview(title_02)
        view.addSubview(title_03)
        return view
    }()

    private lazy var mainTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 32, y: 216, width: 552, height: 26))
        label.backgroundColor = whiteColor
        label.textColor = bkColor
        label.text = "請重新輸入8位以上包含半形英文+數字作為新密碼"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let titleNewPassword = setTitle(x: 32, y: 264, titleName: "新密碼*")
        backgroundView.addSubview(titleNewPassword)
        let titleConfirmPassword = setTitle(x: 32, y: 424, titleName: "確認新密碼*")
        backgroundView.addSubview(titleConfirmPassword)
        
        textBoxView.addSubview(newPasswordTextField)
        backgroundView.addSubview(anotherTextBoxView)
        anotherTextBoxView.addSubview(confirmPasswordTextField)
        
        backgroundView.addSubview(schematicDiagram)
        backgroundView.addSubview(mainTitle)
        backgroundView.addSubview(proceedButton)
    }
}
