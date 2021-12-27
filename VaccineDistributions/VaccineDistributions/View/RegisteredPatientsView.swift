//
//  RegisteredPatients.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/17.
//

import Foundation
import UIKit

class RegisteredPatientsView: UIViewController {

    var clinicDataBanner: Clinics? = nil

    let sampleData: [Patients] = [
        Patients(registrationDate: "2020/04/10\n08:30", sequence: "0005", patientName: "王◯明", birthDate: "1999/\n04/10", idCard: "A******\n5789", region: "北市", registrationMethod: "事先里辦", inspection: "-"),
        Patients(registrationDate: "2020/04/10\n08:30", sequence: "0004", patientName: "楊◯珮", birthDate: "1999/\n12/12", idCard: "A******\n5189", region: "北市", registrationMethod: "事先網路", inspection: "-"),
        Patients(registrationDate: "2020/04/10\n08:30", sequence: "0003", patientName: "陳◯譁", birthDate: "1979/\n07/10", idCard: "P******\n5456", region: "非北市", registrationMethod: "事先網路", inspection: "已取消"),
        Patients(registrationDate: "2020/04/10\n08:30", sequence: "0002", patientName: "鄭◯新", birthDate: "1970/\n11/15", idCard: "A******\n5733", region: "北市", registrationMethod: "現場", inspection: "-"),
        Patients(registrationDate: "2020/04/10\n08:30", sequence: "0001", patientName: "吳◯昌", birthDate: "1993/\n04/10", idCard: "A******\n4562", region: "北市", registrationMethod: "事先網路", inspection: "-")
    ]

    // MARK: The top banner that houses each clinic information
    // TODO: Should the top banner be pinned at the top; i.e., it cannot move
    private lazy var topBannerView: UIView = {
        let topBanner = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 184))
        topBanner.backgroundColor = priColor
        topBanner.layer.cornerRadius = 32
        topBanner.clipsToBounds = true
        topBanner.layer.maskedCorners = [.layerMinXMaxYCorner]
        return topBanner
    }()

    // MARK: Top bottom page that houses all registered patient information
    // TODO: What if the number of patients registered is more than five
    private lazy var backgroundScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: -30, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scrollView.backgroundColor = gyColor
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 850)
        scrollView.addSubview(topBannerView)
        return scrollView
    }()

    func createTopBannerLabels() -> UIView {
        let view = UIView(frame: CGRect(x: 49, y: 240, width: FULL_WIDTH - 119, height: 26))
        view.backgroundColor = gyColor

        let appointmentLabel        = UILabel(frame: CGRect(x: 0, y: 0, width: 110, height: 26))
        appointmentLabel.textColor  = bkColor
        appointmentLabel.text       = "標題"
        appointmentLabel.font       = UIFont.boldSystemFont(ofSize: 24)

        let sequenceLabel           = UILabel(frame: CGRect(x: 144, y: 0, width: 52, height: 26))
        sequenceLabel.textColor     = bkColor
        sequenceLabel.text          = "序號"
        sequenceLabel.font          = UIFont.boldSystemFont(ofSize: 24)

        let nameLabel               = UILabel(frame: CGRect(x: 231, y: 0, width: 52, height: 26))
        nameLabel.textColor         = bkColor
        nameLabel.text              = "姓名"
        nameLabel.font              = UIFont.boldSystemFont(ofSize: 24)

        let birthLabel              = UILabel(frame: CGRect(x: 323, y: 0, width: 52, height: 26))
        birthLabel.textColor        = bkColor
        birthLabel.text             = "生日"
        birthLabel.font             = UIFont.boldSystemFont(ofSize: 24)

        let idNumberLabel           = UILabel(frame: CGRect(x: 407, y: 0, width: 80, height: 26))
        idNumberLabel.textColor     = bkColor
        idNumberLabel.text          = "身分證"
        idNumberLabel.font          = UIFont.boldSystemFont(ofSize: 24)

        let regionLabel             = UILabel(frame: CGRect(x: 515, y: 0, width: 52, height: 26))
        regionLabel.textColor       = bkColor
        regionLabel.text            = "戶籍"
        regionLabel.font            = UIFont.boldSystemFont(ofSize: 24)

        let registrationLabel       = UILabel(frame: CGRect(x: 591, y: 0, width: 120, height: 26))
        registrationLabel.textColor = bkColor
        registrationLabel.text      = "報名方式"
        registrationLabel.font      = UIFont.boldSystemFont(ofSize: 24)

        let inspectionLabel         = UILabel(frame: CGRect(x: 704, y: 0, width: 120, height: 26))
        inspectionLabel.textColor   = bkColor
        inspectionLabel.text        = "複檢結果"
        inspectionLabel.font        = UIFont.boldSystemFont(ofSize: 24)

        let printLabel              = UILabel(frame: CGRect(x: 846, y: 0, width: 65, height: 26))
        printLabel.textColor        = bkColor
        printLabel.text             = "操作"
        printLabel.font             = UIFont.boldSystemFont(ofSize: 24)

        view.addSubview(appointmentLabel)
        view.addSubview(sequenceLabel)
        view.addSubview(nameLabel)
        view.addSubview(birthLabel)
        view.addSubview(idNumberLabel)
        view.addSubview(regionLabel)
        view.addSubview(registrationLabel)
        view.addSubview(inspectionLabel)
        view.addSubview(printLabel)

        return view
    }

    private func getBackButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 24, y: 72, width: 40, height: 40))
        button.backgroundColor = priColor
        let imageIcon = UIImage(named: "common_arrow_left")
        button.setImage(imageIcon, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }

    @objc func backButtonTapped() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }
    
    // MARK: Generate a button that is used to register a new patient under a specific clinic name
    private func getRegisterButton(quota: Int=100, max: Int=1000) -> UIButton {
        let registerButton = UIButton(frame: CGRect(x: 792, y: 153, width: 184, height: 64))
        // Design and decorate the registerButton first
        // registerButton.frame = CGRect(x: 792, y: 153, width: 194, height: 64)
        registerButton.layer.cornerRadius = 16
        registerButton.clipsToBounds = true
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        registerButton.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 64.0, bottom: 20.0, right: 24.0)

        let registerImage = UIImageView()

        // Shadow effects and offset come here
        registerButton.layer.shadowColor = UIColor.black.cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        registerButton.layer.shadowRadius = 10.0
        registerButton.layer.shadowOpacity = 1.0
        registerButton.layer.masksToBounds = false
        registerButton.setTitle("登入報名", for: .normal)

        if (quota < max && quota > 0) {
            // The registerButtion is selectable and colored as white
            registerButton.backgroundColor = UIColor.white
            registerImage.image = UIImage(named: "register_unlocked")
            registerButton.setTitleColor(bkColor, for: .normal)
            registerButton.addTarget(nil, action: #selector(registerButtonTapped), for: .touchUpInside)
        } else {
            // The registerButton is non-selectable and colored as gray
            registerButton.backgroundColor = gyColor
            registerImage.image = UIImage(named: "register_locked")
            registerButton.setTitleColor(bk_6Color, for: .normal)
        }

        registerImage.frame = CGRect(x: 24, y: 16, width: 32, height: 32)
        registerButton.addSubview(registerImage)
        return registerButton
    }

    @objc private func registerButtonTapped() {
        let registrationSelectionVC = RegistrationSelectionView()
        registrationSelectionVC.modalPresentationStyle = .fullScreen
        present(registrationSelectionVC, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gyColor
        self.view.addSubview(topBannerView)
        self.view.addSubview(backgroundScrollView)

        let clinicRegionStr = "\(clinicDataBanner!.region)\(clinicDataBanner!.village)|新冠肺炎|\(clinicDataBanner!.title)\(clinicDataBanner!.region)"
        
        let warningFlag = ClinicTableCells.topBannerTitle(quota: Int(clinicDataBanner!.availableQuota) ?? 0, max: Int(clinicDataBanner!.maxQuota) ?? 100, inspected: Int(clinicDataBanner!.inspected) ?? 100, clinicName: clinicDataBanner!.title, clinicRegion: clinicRegionStr, vaccineName: clinicDataBanner!.vaccine, implementationDateTime: clinicDataBanner!.admissionDate, registrationDateTime: clinicDataBanner!.registrationDate, forCovid: true)
        
        let topBannerLabel = createTopBannerLabels()
        let backButton = getBackButton()
        let registerButton = getRegisterButton()
        topBannerView.addSubview(backButton)
        topBannerView.addSubview(warningFlag)
        backgroundScrollView.addSubview(registerButton)
        backgroundScrollView.addSubview(topBannerLabel)

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: self.topBannerView.topAnchor, constant: 153),
            registerButton.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 280),
            registerButton.heightAnchor.constraint(equalToConstant: 64),
            registerButton.widthAnchor.constraint(equalToConstant: 184)
        ])

        topBannerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBannerLabel.topAnchor.constraint(equalTo: self.topBannerView.bottomAnchor, constant: 56),
            topBannerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topBannerLabel.heightAnchor.constraint(equalToConstant: 26),
            topBannerLabel.widthAnchor.constraint(equalToConstant: 905)
        ])

        var rowButtons = [UIButton]()
        for i in 0..<5 {
            var tempButton = ClinicTableCells.registeredPatientCell(position: i)
            let tempLabels = ClinicalProperties.createPatientLabels(yPosition: 21+i, patients: sampleData[i])
            ClinicTableCells.appendLabelsToButton(patientLabels: tempLabels, rowButton: &tempButton)
            rowButtons.append(tempButton)
            backgroundScrollView.addSubview(rowButtons[i])
            
            rowButtons[i].translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                rowButtons[i].topAnchor.constraint(equalTo: self.topBannerView.bottomAnchor, constant: 103 + 112*CGFloat(i)),
                rowButtons[i].centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                rowButtons[i].widthAnchor.constraint(equalToConstant: 992),
                rowButtons[i].heightAnchor.constraint(equalToConstant: 96)
            ])

        }

    }

}

