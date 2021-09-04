//
//  CardReaderView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class CardReaderView: UIViewController {

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 220, y: 144, width: 584, height: 480))
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white

        let topBanner = UIView(frame: CGRect(x: 0, y: 0, width: 584, height: 88))
        topBanner.backgroundColor = priColor
        let topLabel = UILabel(frame: CGRect(x: 25, y: 30, width: 200, height: 30))
        topLabel.backgroundColor = priColor
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.boldSystemFont(ofSize: 28)
        topLabel.text = "硬體資訊"

        let contentTitle = UILabel(frame: CGRect(x: 24, y: 120, width: 300, height: 26))
        contentTitle.backgroundColor = UIColor.white
        contentTitle.textColor = bkColor
        contentTitle.font = contentTitle.font.withSize(24)
        contentTitle.text = "連線狀態與電量資訊"

        let hardwareTitle = UILabel(frame: CGRect(x: 24, y: 200, width: 300, height: 26))
        hardwareTitle.backgroundColor = UIColor.white
        hardwareTitle.textColor = bkColor
        hardwareTitle.font = hardwareTitle.font.withSize(24)
        hardwareTitle.text = "硬體測試"

        let topLine = UILabel(frame: CGRect(x: 24, y: 176, width: 536, height: 2))
        topLine.backgroundColor = bkColor
        let bottomLine = UILabel(frame: CGRect(x: 24, y: 248, width: 536, height: 2))
        bottomLine.backgroundColor = bkColor

        topBanner.addSubview(topLabel)
        topBanner.addSubview(exitButton)

        let chipLogo = UIImage(named: "Component 42 – 12")
        let chipLogoView = UIImageView(frame: CGRect(x: 520, y: 112, width: 40, height: 40))
        chipLogoView.image = chipLogo

        view.addSubview(chipLogoView)
        view.addSubview(topLine)
        view.addSubview(bottomLine)
        view.addSubview(contentTitle)
        view.addSubview(hardwareTitle)
        view.addSubview(topBanner)

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
            backgroundView.heightAnchor.constraint(equalToConstant: 480)
        ])

    }

    private lazy var exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 521, y: 24, width: 40, height: 40))
        button.setImage(UIImage(named: "common_cancel_w"), for: .normal)
        button.backgroundColor = priColor
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func exitButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

}
