//
//  RegistrationSelection.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/18.
//

import Foundation
import UIKit

class RegistrationSelectionView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = priColor
        let tapCardFigure = UIImageView(frame: CGRect(x: 152, y: 392, width: 240, height: 240))
        tapCardFigure.image = UIImage(named: "common_card")
        self.view.addSubview(tapCardFigure)
        
        let topLabel = UILabel(frame: CGRect(x: 229, y: 420, width: 566, height: 36))
        topLabel.text = "請出示健保卡或使用台北通QRcode"
        topLabel.font = UIFont.boldSystemFont(ofSize: 36.0)
        topLabel.textColor = UIColor.white
        topLabel.textAlignment = .center
        
        let bottomLabel = UILabel(frame: CGRect(x: 404, y: 468, width: 216, height: 36))
        bottomLabel.text = "驗證您的身份"
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 36.0)
        bottomLabel.textColor = UIColor.white
        bottomLabel.textAlignment = .center
        
        // Labels come here
        self.view.addSubview(tapCardFigure)
        self.view.addSubview(topLabel)
        self.view.addSubview(bottomLabel)

        tapCardFigure.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tapCardFigure.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200),
            tapCardFigure.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: tapCardFigure.bottomAnchor, constant: 28),
            topLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 12),
            bottomLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])

        // Exit Button
        let exitButton = getExitButton()
        self.view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24),
            exitButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])

        // QR Scanner Button
        let qrRegistrationButton = getQRRegistrationButton()
        self.view.addSubview(qrRegistrationButton)
        NSLayoutConstraint.activate([
            qrRegistrationButton.topAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: 104),
            qrRegistrationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -160),
            qrRegistrationButton.widthAnchor.constraint(equalToConstant: 272),
            qrRegistrationButton.heightAnchor.constraint(equalToConstant: 72)
        ])
        
        // Manual Registration Button
        let manualRegistrationButton = getManualRegistrationButton()
        self.view.addSubview(manualRegistrationButton)
        NSLayoutConstraint.activate([
            manualRegistrationButton.topAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: 104),
            manualRegistrationButton.rightAnchor.constraint(equalTo: qrRegistrationButton.rightAnchor, constant: 320),
            manualRegistrationButton.widthAnchor.constraint(equalToConstant: 272),
            manualRegistrationButton.heightAnchor.constraint(equalToConstant: 72)
        ])

    }

    private func getExitButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 960, y: 24, width: 40, height: 40))
        button.setImage(UIImage(named: "common_cancel_w"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }

    @objc func exitButtonTapped() {
        let registeredPatientsVC = RegisteredPatientsView()
        registeredPatientsVC.modalPresentationStyle = .fullScreen
        present(registeredPatientsVC, animated: false, completion: nil)
    }

    private func getQRRegistrationButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 216, y: 608, width: 272, height: 72))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        button.setTitle("掃描台北痛QRcode", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(QRRegistrationButtonTapped), for: .touchUpInside)
        return button
    }

    @objc func QRRegistrationButtonTapped() {
        print("DEBUG from RegistrationSelectionVC: \(#function) \(#line)")
//        let qrRegistrationVC = QRRegistrationVC()
//        qrRegistrationVC.modalPresentationStyle = .fullScreen
//        present(qrRegistrationVC, animated: false, pushing: true, completion: nil)
    }

    private func getManualRegistrationButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 536, y: 608, width: 272, height: 72))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        button.setTitle("手動輸入資料", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(bkColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(ManualRegistrationButtonTapped), for: .touchUpInside)
        return button
    }

    @objc func ManualRegistrationButtonTapped() {
        let manualRegistrationVC = ManualRegistrationView()
        manualRegistrationVC.modalPresentationStyle = .fullScreen
        present(manualRegistrationVC, animated: false, completion: nil)
    }

}
