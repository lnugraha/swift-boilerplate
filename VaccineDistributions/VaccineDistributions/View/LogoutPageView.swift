//
//  LogoutPageView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class LogoutPageView: UIViewController {

    // MARK: (2021/07/21) These new UI elements do not rely on storyboard elements
    private lazy var backgroundViewPanel: UIView = {
        let view = UIView(frame: CGRect(x: 328, y: 244, width: 368, height: 280))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true

        let imageIcon = UIImageView(frame: CGRect(x: 136, y: 33, width: 96, height: 96))
        imageIcon.image = UIImage(named: "alert_info")
        view.addSubview(imageIcon)

        let textLabel = UILabel(frame: CGRect(x: 112, y: 153, width: 160, height: 28))
        textLabel.text = "確定要登出？"
        textLabel.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel.textAlignment = .center
        textLabel.textColor = bkColor
        view.addSubview(textLabel)
        
        return view
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 184, y: 208, width: 184, height: 72))
        button.setTitle("確定登出", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24)
        button.backgroundColor = priColor
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: Send an HTTP DELETE request to web API server, upon a return of 200 code, return back to ViewController
    @objc func logoutButtonTapped() {
        let loginPageView = LoginPageViewLocked()
        loginPageView.modalPresentationStyle = .fullScreen
        present(loginPageView, animated: false, completion: nil)
    }

    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 208, width: 184, height: 72))
        button.setTitle("取消", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24)
        button.backgroundColor = bkColor
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func cancelButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(backgroundViewPanel)
        backgroundViewPanel.addSubview(logoutButton)
        backgroundViewPanel.addSubview(cancelButton)
        backgroundViewPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundViewPanel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundViewPanel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            backgroundViewPanel.widthAnchor.constraint(equalToConstant: 368),
            backgroundViewPanel.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}
