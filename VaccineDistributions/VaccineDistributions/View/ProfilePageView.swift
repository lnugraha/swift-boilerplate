//
//  ProfilePageView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class ProfilePageView: UIViewController {

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 220, y: 20, width: 584, height: 728))
        view.backgroundColor = whiteColor
        view.layer.cornerRadius = 16
        view.clipsToBounds = true

        let topBanner = UIView(frame: CGRect(x: 0, y: 0, width: 584, height: 88))
        topBanner.backgroundColor = priColor

        let mainTitle = UILabel(frame: CGRect(x: 24, y: 24, width: 400, height: 40))
        mainTitle.text = "個人資訊"
        mainTitle.font = UIFont.boldSystemFont(ofSize: 32.0)
        mainTitle.textColor = whiteColor

        let nameLine = UILabel(frame: CGRect(x: 24, y: 160, width: 536, height: 1))
        nameLine.backgroundColor = bkColor

        let accLine = UILabel(frame: CGRect(x: 24, y: 232, width: 536, height: 1))
        accLine.backgroundColor = bkColor

        let emailLine = UILabel(frame: CGRect(x: 24, y: 304, width: 536, height: 1))
        emailLine.backgroundColor = bkColor

        let phoneLine = UILabel(frame: CGRect(x: 24, y: 376, width: 536, height: 1))
        phoneLine.backgroundColor = bkColor

        let serviceLine = UILabel(frame: CGRect(x: 24, y: 448, width: 536, height: 1))
        serviceLine.backgroundColor = bkColor

        let authLine = UILabel(frame: CGRect(x: 24, y: 520, width: 536, height: 1))
        authLine.backgroundColor = bkColor

        let passwordLine = UILabel(frame: CGRect(x: 24, y: 624, width: 536, height: 1))
        passwordLine.backgroundColor = bkColor

        let TEXTBOX_WIDTH = 200; let X_OFFSET = 24
        let nameTag = UILabel(frame: CGRect(x: X_OFFSET, y: 112, width: TEXTBOX_WIDTH, height: 26))
        nameTag.textColor = bk_6Color
        nameTag.font = UIFont.systemFont(ofSize: 24.0)
        nameTag.backgroundColor = UIColor.white
        nameTag.text = "姓名"

        let nameLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 112, width: TEXTBOX_WIDTH, height: 26))
        nameLabel.textColor = bkColor
        nameLabel.font = UIFont.systemFont(ofSize: 24.0)
        nameLabel.backgroundColor = UIColor.white
        nameLabel.text = "陳德禮"
        nameLabel.textAlignment = .right

        let accTag = UILabel(frame: CGRect(x: X_OFFSET, y: 184, width: TEXTBOX_WIDTH, height: 26))
        accTag.textColor = bk_6Color
        accTag.font = UIFont.systemFont(ofSize: 24.0)
        accTag.backgroundColor = UIColor.white
        accTag.text = "帳號"

        let accLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 184, width: 2*TEXTBOX_WIDTH, height: 26))
        accLabel.textColor = bkColor
        accLabel.font = UIFont.systemFont(ofSize: 24.0)
        accLabel.backgroundColor = UIColor.white
        accLabel.text = "leo.1.nugraha@gmail.com"
        accLabel.textAlignment = .right

        let emailTag = UILabel(frame: CGRect(x: X_OFFSET, y: 253, width: TEXTBOX_WIDTH, height: 26))
        emailTag.textColor = bk_6Color
        emailTag.font = UIFont.systemFont(ofSize: 24.0)
        emailTag.backgroundColor = UIColor.white
        emailTag.text = "Email"

        let emailLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 253, width: 2*TEXTBOX_WIDTH, height: 26))
        emailLabel.textColor = bkColor
        emailLabel.font = UIFont.systemFont(ofSize: 24.0)
        emailLabel.backgroundColor = UIColor.white
        emailLabel.text = "leo.1.nugraha@gmail.com"
        emailLabel.textAlignment = .right

        let phoneTag = UILabel(frame: CGRect(x: X_OFFSET, y: 328, width: TEXTBOX_WIDTH, height: 26))
        phoneTag.textColor = bk_6Color
        phoneTag.font = UIFont.systemFont(ofSize: 24.0)
        phoneTag.backgroundColor = UIColor.white
        phoneTag.text = "手機"

        let phoneLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 328, width: TEXTBOX_WIDTH, height: 26))
        phoneLabel.textColor = bkColor
        phoneLabel.font = UIFont.systemFont(ofSize: 24.0)
        phoneLabel.backgroundColor = UIColor.white
        phoneLabel.text = "0988276210"
        phoneLabel.textAlignment = .right

        let serviceTag = UILabel(frame: CGRect(x: X_OFFSET, y: 400, width: TEXTBOX_WIDTH, height: 26))
        serviceTag.textColor = bk_6Color
        serviceTag.font = UIFont.systemFont(ofSize: 24.0)
        serviceTag.backgroundColor = UIColor.white
        serviceTag.text = "服務單位"

        let serviceLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 400, width: TEXTBOX_WIDTH, height: 26))
        serviceLabel.textColor = bkColor
        serviceLabel.font = UIFont.systemFont(ofSize: 24.0)
        serviceLabel.backgroundColor = UIColor.white
        serviceLabel.text = "內湖區西康里里長"
        serviceLabel.textAlignment = .right

        let authTag = UILabel(frame: CGRect(x: X_OFFSET, y: 472, width: TEXTBOX_WIDTH, height: 26))
        authTag.textColor = bk_6Color
        authTag.font = UIFont.systemFont(ofSize: 24.0)
        authTag.backgroundColor = UIColor.white
        authTag.text = "權限"

        let authLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 472, width: TEXTBOX_WIDTH, height: 26))
        authLabel.textColor = bkColor
        authLabel.font = UIFont.systemFont(ofSize: 24.0)
        authLabel.backgroundColor = UIColor.white
        authLabel.text = "系統管理員"
        authLabel.textAlignment = .right

        let regionTag = UILabel(frame: CGRect(x: X_OFFSET, y: 648, width: TEXTBOX_WIDTH, height: 26))
        regionTag.textColor = bk_6Color
        regionTag.font = UIFont.systemFont(ofSize: 24.0)
        regionTag.backgroundColor = UIColor.white
        regionTag.text = "管理區域"

        let regionLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 648, width: TEXTBOX_WIDTH, height: 60))
        regionLabel.textColor = bkColor
        regionLabel.font = UIFont.systemFont(ofSize: 24.0)
        regionLabel.backgroundColor = UIColor.white
        regionLabel.numberOfLines = 0
        regionLabel.lineBreakMode = .byWordWrapping
        regionLabel.text = "管理全區\n內湖區 - 管理全里"
        regionLabel.textAlignment = .right

        let topPwdTag = UILabel(frame: CGRect(x: X_OFFSET, y: 544, width: TEXTBOX_WIDTH, height: 26))
        topPwdTag.textColor = bk_6Color
        topPwdTag.font = UIFont.systemFont(ofSize: 24.0)
        topPwdTag.backgroundColor = UIColor.white
        topPwdTag.text = "密碼最後"

        let topPwdLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 544, width: TEXTBOX_WIDTH, height: 26))
        topPwdLabel.textColor = bkColor
        topPwdLabel.font = UIFont.systemFont(ofSize: 24.0)
        topPwdLabel.backgroundColor = UIColor.white
        topPwdLabel.text = "2021/06/25"
        topPwdLabel.textAlignment = .right

        let bottomPwdTag = UILabel(frame: CGRect(x: X_OFFSET, y: 576, width: TEXTBOX_WIDTH, height: 26))
        bottomPwdTag.textColor = bk_6Color
        bottomPwdTag.font = UIFont.systemFont(ofSize: 24.0)
        bottomPwdTag.backgroundColor = UIColor.white
        bottomPwdTag.text = "更新日期"

        let bottomPwdLabel = UILabel(frame: CGRect(x: 284-X_OFFSET, y: 576, width: 2*TEXTBOX_WIDTH, height: 26))
        bottomPwdLabel.textColor = bk_6Color
        bottomPwdLabel.font = UIFont.systemFont(ofSize: 24.0)
        bottomPwdLabel.backgroundColor = UIColor.white
        bottomPwdLabel.text = "到期日：2021/09/25"
        bottomPwdLabel.textAlignment = .right

        topBanner.addSubview(exitButton)
        topBanner.addSubview(mainTitle)
        view.addSubview(topBanner)
        view.addSubview(nameLine)
        view.addSubview(accLine)
        view.addSubview(emailLine)
        view.addSubview(phoneLine)
        view.addSubview(serviceLine)
        view.addSubview(authLine)
        view.addSubview(passwordLine)

        view.addSubview(nameTag)
        view.addSubview(accTag)
        view.addSubview(phoneTag)
        view.addSubview(serviceTag)
        view.addSubview(emailTag)
        view.addSubview(authTag)
        view.addSubview(topPwdTag)
        view.addSubview(bottomPwdTag)
        view.addSubview(regionTag)
        
        view.addSubview(nameLabel)
        view.addSubview(accLabel)
        view.addSubview(emailLabel)
        view.addSubview(accLabel)
        view.addSubview(phoneLabel)
        view.addSubview(serviceLabel)
        view.addSubview(authLabel)
        view.addSubview(topPwdLabel)
        view.addSubview(bottomPwdLabel)
        view.addSubview(regionLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        accLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 184),
            accLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            accLabel.widthAnchor.constraint(equalToConstant: 400),
            accLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 253),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailLabel.widthAnchor.constraint(equalToConstant: 400),
            emailLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 328),
            phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            phoneLabel.widthAnchor.constraint(equalToConstant: 200),
            phoneLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        serviceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            serviceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            serviceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            serviceLabel.widthAnchor.constraint(equalToConstant: 200),
            serviceLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        authLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 472),
            authLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            authLabel.widthAnchor.constraint(equalToConstant: 200),
            authLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        topPwdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topPwdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 544),
            topPwdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            topPwdLabel.widthAnchor.constraint(equalToConstant: 200),
            topPwdLabel.heightAnchor.constraint(equalToConstant: 26)
        ])

        bottomPwdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomPwdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 576),
            bottomPwdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            bottomPwdLabel.widthAnchor.constraint(equalToConstant: 400),
            bottomPwdLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 648),
            regionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            regionLabel.widthAnchor.constraint(equalToConstant: 200),
            regionLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        self.view.addSubview(backgroundView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 584),
            backgroundView.heightAnchor.constraint(equalToConstant: 728)
        ])

    }

    private lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 520, y: 24, width: 40, height: 40))
        let imageLogo = UIImage(named: "common_cancel_w")
        button.setImage(imageLogo, for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func exitButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

}
