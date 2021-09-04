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
        nameTag.font = nameTag.font.withSize(24.0)
        nameTag.backgroundColor = UIColor.white
        nameTag.text = "姓名"

        let accTag = UILabel(frame: CGRect(x: X_OFFSET, y: 184, width: TEXTBOX_WIDTH, height: 26))
        accTag.textColor = bk_6Color
        accTag.font = accTag.font.withSize(24.0)
        accTag.backgroundColor = UIColor.white
        accTag.text = "帳號"

        let emailTag = UILabel(frame: CGRect(x: X_OFFSET, y: 253, width: TEXTBOX_WIDTH, height: 26))
        emailTag.textColor = bk_6Color
        emailTag.font = emailTag.font.withSize(24.0)
        emailTag.backgroundColor = UIColor.white
        emailTag.text = "Email"

        let phoneTag = UILabel(frame: CGRect(x: X_OFFSET, y: 328, width: TEXTBOX_WIDTH, height: 26))
        phoneTag.textColor = bk_6Color
        phoneTag.font = phoneTag.font.withSize(24.0)
        phoneTag.backgroundColor = UIColor.white
        phoneTag.text = "手機"

        let serviceTag = UILabel(frame: CGRect(x: X_OFFSET, y: 400, width: TEXTBOX_WIDTH, height: 26))
        serviceTag.textColor = bk_6Color
        serviceTag.font = serviceTag.font.withSize(24.0)
        serviceTag.backgroundColor = UIColor.white
        serviceTag.text = "服務單位"

        let authTag = UILabel(frame: CGRect(x: X_OFFSET, y: 472, width: TEXTBOX_WIDTH, height: 26))
        authTag.textColor = bk_6Color
        authTag.font = authTag.font.withSize(24.0)
        authTag.backgroundColor = UIColor.white
        authTag.text = "權限"

        let regionTag = UILabel(frame: CGRect(x: X_OFFSET, y: 648, width: TEXTBOX_WIDTH, height: 26))
        regionTag.textColor = bk_6Color
        regionTag.font = regionTag.font.withSize(24.0)
        regionTag.backgroundColor = UIColor.white
        regionTag.text = "管理區域"

        let topPwdTag = UILabel(frame: CGRect(x: X_OFFSET, y: 544, width: TEXTBOX_WIDTH, height: 26))
        topPwdTag.textColor = bk_6Color
        topPwdTag.font = topPwdTag.font.withSize(24.0)
        topPwdTag.backgroundColor = UIColor.white
        topPwdTag.text = "密碼最後"

        let bottomPwdTag = UILabel(frame: CGRect(x: X_OFFSET, y: 576, width: TEXTBOX_WIDTH, height: 26))
        bottomPwdTag.textColor = bk_6Color
        bottomPwdTag.font = bottomPwdTag.font.withSize(24.0)
        bottomPwdTag.backgroundColor = UIColor.white
        bottomPwdTag.text = "更新日期"

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
