//
//  PopUpController.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/14.
//

import Foundation
import UIKit

// MARK: Alert successful message in 60/69
class PasswordChangedAlertSuccessful: UIViewController {

    private lazy var passwordChangedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 384, y: 280, width: 256, height: 208))
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 16
        button.clipsToBounds = true

        let imageIcon = UIImageView(frame: CGRect(x: 80, y: 32, width: 96, height: 96))
        imageIcon.image = UIImage(named: "alert_success")

        let textLabel = UILabel(frame: CGRect(x: 37, y: 152, width: 190, height: 28))
        textLabel.text = "您的密碼已更新！"
        textLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        textLabel.textColor = bkColor

        button.addSubview(imageIcon)
        button.addSubview(textLabel)

        button.addTarget(self, action: #selector(passwordChangedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func passwordChangedButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(passwordChangedButton)
        passwordChangedButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            passwordChangedButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordChangedButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            passwordChangedButton.widthAnchor.constraint(equalToConstant: 256),
            passwordChangedButton.heightAnchor.constraint(equalToConstant: 207)
        ])
    }

}

class SuccessChangePasswordVC: UIViewController {

    private lazy var backgroundViewPanel: UIView = {
        let view = UIView(frame: CGRect(x: 288, y: 244, width: 392, height: 284))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true

        let checkLogo = UIImageView(frame: CGRect(x: 148, y: 32, width: 96, height: 96))
        checkLogo.image = UIImage(named: "alert_success")

        let successMessage = UILabel(frame: CGRect(x: 33, y: 152, width: 340, height: 25))
        successMessage.text = "您的密碼已更新，請重新登入 !"
        successMessage.font = UIFont.boldSystemFont(ofSize: 24.0)
        successMessage.textColor = bkColor
        successMessage.textAlignment = .center

        view.addSubview(checkLogo)
        view.addSubview(successMessage)
        return view
    }()

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 212, width: 392, height: 72))
        button.setTitle("了解", for: .normal)
        button.backgroundColor = priColor
        button.tintColor = UIColor.white
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func proceedButtonTapped() {
        let loginPageViewLocked = LoginPageViewLocked()
        loginPageViewLocked.modalPresentationStyle = .fullScreen
        present(loginPageViewLocked, animated: false, completion: nil)
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(backgroundViewPanel)
        backgroundViewPanel.addSubview(proceedButton)
        backgroundViewPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundViewPanel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            backgroundViewPanel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            backgroundViewPanel.widthAnchor.constraint(equalToConstant: 392),
            backgroundViewPanel.heightAnchor.constraint(equalToConstant: 284)
        ])
    }
}

class RegistrationSuccessful: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundView = UIView(frame: CGRect(x: 296, y: 228, width: 432, height: 312))
        self.view.backgroundColor = bgColor

        let successfulImage = UIImageView(frame: CGRect(x: 164, y: 32, width: 96, height: 96))
        successfulImage.image = UIImage(named: "alert_success")

        let successfulText = UILabel(frame: CGRect(x: 116, y: 152, width: 210, height: 70))
        successfulText.textAlignment = .center
        successfulText.numberOfLines = 0
        successfulText.lineBreakMode = NSLineBreakMode.byWordWrapping
        successfulText.text = "您已報名本次活動\n序號：012"
        successfulText.textColor = bkColor
        successfulText.font = UIFont.boldSystemFont(ofSize: 28.0)

        let backButton = getBackButton()
        backgroundView.addSubview(backButton)
        
        let printButton = getPrintButton()
        backgroundView.addSubview(printButton)
        
        backgroundView.addSubview(successfulImage)
        backgroundView.addSubview(successfulText)

        backgroundView.layer.cornerRadius = 16
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = UIColor.white

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.sizeToFit()
        self.view.addSubview(backgroundView) // This must be written before NSLayoutConstraint
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 432),
            backgroundView.heightAnchor.constraint(equalToConstant: 312),
        ])
    }

    private func getBackButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 240, width: 217, height: 72))
        button.setTitle("返回", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.backgroundColor = bkColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func backButtonTapped() {
        // Bring view controller back to RegistrationSelectionVC
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    private func getPrintButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 216, y: 240, width: 217, height: 72))
        button.setTitle("列印標籤後返回", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24.0)
        button.backgroundColor = priColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(printButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func printButtonTapped() {
        print("DEBUG: The print button function will be coming soon")
    }
}
