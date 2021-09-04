//
//  OTPEntryView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class OTPEntryView: UIViewController {
    
    var timer: Timer?
    var isTimerRunning = false
    var confirmationDuration = 240
    var secondsRemaining = 60

    private lazy var backgroundView: UIView = {
        let background = UIView(frame: CGRect(x: 276, y: 144, width: 472, height: 480))
        background.layer.cornerRadius = 16
        background.clipsToBounds = true
        background.backgroundColor = UIColor.white
        let line = UILabel(frame: CGRect(x: 48, y: 328, width: 376, height: 2))
        line.backgroundColor = bk_4Color
        background.addSubview(line)
        return background
    }()

    private lazy var mainTitle: UILabel = {
        let mainTitle = UILabel(frame: CGRect(x: 32, y: 36, width: 300, height: 35))
        mainTitle.textColor = priColor
        mainTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        mainTitle.text = "身分驗證 (240s)"
        return mainTitle
    }()

    private lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 400, y: 32, width: 40, height: 40))
        let buttonIcon = UIImage(named: "common_cancel")
        button.setImage(buttonIcon, for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 188, y: 352, width: 120, height: 26))
        button.setTitle("回登入頁", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func exitButtonTapped() {
        let loginPageView = LoginPageViewLocked()
        loginPageView.modalPresentationStyle = .fullScreen
        self.present(loginPageView, animated: false, completion: nil)
    }

    private lazy var textMessage: UILabel = {
        let message = UILabel(frame: CGRect(x: 34, y: 112, width: 408, height: 26))
        message.text = "請輸入6位數驗證碼以完成身分確認"
        message.textColor = bkColor
        message.font = message.font.withSize(24.0)
        return message
    }()

    private lazy var horizontalBar: UIView = {
        let bar = UIView(frame: CGRect(x: 48, y: 328, width: 376, height: 2))
        bar.backgroundColor = bkColor
        return bar
    }()

    private lazy var OTPTextBox: UILabel = {
        let label = UILabel(frame: CGRect(x: 32, y: 152, width: 408, height: 56))
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 8
        label.layer.borderColor = bkColor.cgColor
        label.layer.borderWidth = 1.0
        label.clipsToBounds = true
        return label
    }()

    private lazy var OTPTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 48, y: 168, width: 376, height: 28))
        textField.placeholder = "請輸入驗證碼"
        textField.textColor = bkColor
        textField.font = textField.font?.withSize(24.0)
        return textField
    }()

    private lazy var resendOTPButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 86, y: 272, width: 320, height: 34))
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.setImage(UIImage(named: "Component 186 – 1"), for: .normal)
        button.setTitle("重新傳送驗證碼 (60s)", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.setTitleColor(bk_6Color, for: .normal)
        button.addTarget(self, action: #selector(resendOTPButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func resendOTPButtonTapped() {

        if self.isTimerRunning == false {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsRemaining > 0 {
                    self.secondsRemaining -= 1
                    self.resendOTPButton.setTitle("重新傳送驗證碼 (" + String(self.secondsRemaining) + "s)", for: .normal)
                    self.isTimerRunning = true
                } else {
                    Timer.invalidate()
                } // end-if self.secondsRemaining
            }
        } // end-if isTimerRunning
    }
    
    private lazy var warningMessage: UILabel = {
        let warning = UILabel(frame: CGRect(x: 32, y: 220, width: 408, height: 26))
        warning.backgroundColor = UIColor.white
        warning.textColor = UIColor.red
        warning.font = warning.font.withSize(18.0)
        return warning
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 408, width: 472, height: 72))
        button.backgroundColor = priColor
        button.setTitle("確定", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.addTarget(self, action: #selector(confirmButtonPressed), for: .touchUpInside)
        return button
    }()

    @objc func confirmButtonPressed() {
        print("DEBUG: \(#function) \(#line) Safe Zone and will be tossed to API")
        if OTPTextField.text != "123456" {
            self.warningMessage.text = "驗證碼無效，請重新輸入！"

        } else {
            let mainPageView = MainPageView()
            mainPageView.modalPresentationStyle = .fullScreen
            self.present(mainPageView, animated: false, completion: nil)
        }
    }

    // MARK: Handles countdown timer 240 seconds; if the time runs out, bring back to the previous page
    @objc func update() {
        if confirmationDuration > 0 {
            confirmationDuration -= 1
            self.mainTitle.text = "身分驗證 (" + String(confirmationDuration) + "s)"
        } else if confirmationDuration == 0 {
            let loginPageView = LoginPageView()
            loginPageView.modalPresentationStyle = .fullScreen
            self.present(loginPageView, animated: false, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bg_8Color
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
        self.view.addSubview(backgroundView)

        backgroundView.addSubview(mainTitle)
        backgroundView.addSubview(exitButton)
        backgroundView.addSubview(textMessage)
        backgroundView.addSubview(warningMessage)
        backgroundView.addSubview(backButton)
        backgroundView.addSubview(horizontalBar)
        backgroundView.addSubview(OTPTextBox)
        backgroundView.addSubview(OTPTextField)
        backgroundView.addSubview(resendOTPButton)
        backgroundView.addSubview(confirmButton)

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 480),
            backgroundView.widthAnchor.constraint(equalToConstant: 472)
        ])
    }
}
