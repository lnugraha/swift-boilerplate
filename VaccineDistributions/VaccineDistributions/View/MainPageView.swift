//
//  MainPageView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

class MainPageView: UIViewController, UIPopoverPresentationControllerDelegate {

    let sampleData: [Clinics] = [
        Clinics(title: "110年六月肺鏈\n及流感疫苗施打", vaccine: "新冠肺炎:\nBioNTech(BNT)", region: "內湖區", village: "西康里", registrationDate: "2020/04/10 08:00-2020/04/10 20:00", availableQuota: "3000", maxQuota: "12000", inspected: "100", admissionDate: "2020/04/10 08:30 - 11:30"),
        Clinics(title: "110年五月肺鏈\n及流感疫苗施打", vaccine: "新冠肺炎:\nAstraZeneca(AZ)", region: "內湖區", village: "西康里", registrationDate: "2020/04/10 08:00-2020/04/10 20:00", availableQuota: "980", maxQuota: "1000", inspected: "100", admissionDate: "2020/04/10 08:30 - 11:30"),
        Clinics(title: "110年五月肺鏈 及流感疫苗施打", vaccine: "肺鏈/流感", region: "內湖區", village: "西湖里", registrationDate: "2020/04/10 08:00-2020/04/10 20:00", availableQuota: "0", maxQuota: "300", inspected: "100", admissionDate: "2020/03/28 08:30 - 11:30"),
        Clinics(title: "110年一月肺鏈 及流感疫苗施打", vaccine: "肺鏈/流感", region: "信義區", village: "敦厚里", registrationDate: "2020/04/10 08:00-2020/04/10 20:00", availableQuota: "3000", maxQuota: "3000", inspected: "100", admissionDate: "2020/04/10 08:30 - 11:30"),
        Clinics(title: "110年一月肺鏈 及流感疫苗施打", vaccine: "新冠肺炎:\nModerna", region: "內湖區", village: "光明里", registrationDate: "2020/04/10 08:00-2020/04/10 20:00", availableQuota: "300", maxQuota: "400", inspected: "100", admissionDate: "2020/04/10 08:30 - 11:30")]

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = gyColor
        return view
    }()

    private lazy var bannerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 144*HEIGHT_SCALING_FACTOR))
        view.backgroundColor = priColor
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMaxYCorner]
        view.clipsToBounds = true

        let imageLogo = UIImageView(frame: CGRect(x: 16, y: 48, width: 48, height: 48))
        imageLogo.image = UIImage(named: "Group 5494")

        let imageLabel = UILabel(frame: CGRect(x: 72, y: 52, width: 500, height: 40))
        imageLabel.text = "里辦疫苗接種便民資訊系統"
        imageLabel.textColor = UIColor.white
        imageLabel.backgroundColor = priColor
        imageLabel.font = UIFont.boldSystemFont(ofSize: 28*TEXT_SCALING_FACTOR)

        let accountLogo = UIImageView(frame: CGRect(x: FULL_WIDTH-176, y: 56, width: 32, height: 32))
        accountLogo.image = UIImage(named: "Component 163 – 1")

        let accountHolder = UILabel(frame: CGRect(x: FULL_WIDTH-142, y: 56, width: 86, height: 32))
        accountHolder.text = "陳德禮"
        accountHolder.textAlignment = .center
        accountHolder.font = UIFont.systemFont(ofSize: 28*TEXT_SCALING_FACTOR)
        accountHolder.textColor = UIColor.white
        accountHolder.backgroundColor = priColor

        view.addSubview(imageLogo)
        view.addSubview(imageLabel)
        view.addSubview(accountLogo)
        view.addSubview(accountHolder)
        view.addSubview(dropDownButton)
    
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16*WIDTH_SCALING_FACTOR),
            imageLogo.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48/CGFloat(144)),
            imageLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48/CGFloat(144))
        ])

        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageLabel.leadingAnchor.constraint(equalTo: imageLogo.trailingAnchor, constant: 8*WIDTH_SCALING_FACTOR),
            imageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 500/CGFloat(ABSOLUTE_WIDTH)),
            imageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40/CGFloat(144))
        ])

        accountLogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accountLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            accountLogo.trailingAnchor.constraint(equalTo: accountHolder.leadingAnchor, constant: -4*WIDTH_SCALING_FACTOR),
            accountLogo.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 32/CGFloat(144)),
            accountLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 32/CGFloat(144))
        ])

        accountHolder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accountHolder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            accountHolder.trailingAnchor.constraint(equalTo: dropDownButton.leadingAnchor, constant: -4*WIDTH_SCALING_FACTOR),
            accountHolder.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 86/CGFloat(144)),
            accountHolder.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 32/CGFloat(144))
        ])

        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            dropDownButton.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -16*WIDTH_SCALING_FACTOR),
            dropDownButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 32/CGFloat(144)),
            dropDownButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 32/CGFloat(144))
        ])

        return view
    }()

    private lazy var dropDownButton: UIButton = {
        let button = UIButton(frame: CGRect(x: FULL_WIDTH-48, y: 56, width: 32, height: 32))
        button.setImage(UIImage(named: "common_arrow_down"), for: .normal)
        button.addTarget(self, action: #selector(dropDownButtonTapped(sender: )), for: .touchUpInside)
        return button
    }()

    @objc func dropDownButtonTapped(sender: UIButton) {

        let popOverMenu = PopOverDisplayViewController()
        popOverMenu.modalPresentationStyle = .popover
        if let popOverPresentationController = popOverMenu.popoverPresentationController {
            popOverPresentationController.permittedArrowDirections = .up
            popOverPresentationController.sourceView = dropDownButton
            popOverPresentationController.sourceRect = dropDownButton.bounds
            popOverPresentationController.delegate = self
            present(popOverMenu, animated: true, completion: nil)
        }

    }

    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(backgroundView)
        self.view.addSubview(bannerView)

        let topBannerLaber: UIView = createTopBannerLabels()
        backgroundView.addSubview(topBannerLaber)

        topBannerLaber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBannerLaber.topAnchor.constraint(equalTo: self.bannerView.bottomAnchor, constant: 25),
            topBannerLaber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topBannerLaber.widthAnchor.constraint(equalToConstant: 891),
            topBannerLaber.heightAnchor.constraint(equalToConstant: 24)
        ])

        var rowButtons = [UIButton]()
        for i in 0..<5 {
            var tempButton = ClinicTableCells.addClinicalDataLabel(position: i)
            let tempLabels = ClinicalProperties.createClinicLabels(yPosition: 24.0, clinics: sampleData[i])

            if tempLabels.vaccine.text == "肺鏈/流感" {
                tempButton.addTarget(self, action: #selector(tapDeadButton), for: .touchUpInside)
            } else {
                tempButton.addTarget(self, action: #selector(registeredPatientButtonTapped), for: .touchUpInside)
            }

            ClinicalProperties.appendLabelsToButton(clinicalLabel: tempLabels, rowButton: &tempButton)
            rowButtons.append(tempButton)
            backgroundView.addSubview(rowButtons[i])

            rowButtons[i].translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                rowButtons[i].topAnchor.constraint(equalTo: self.bannerView.bottomAnchor, constant: 64*HEIGHT_SCALING_FACTOR + 112*CGFloat(i)),
                rowButtons[i].centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                rowButtons[i].heightAnchor.constraint(equalToConstant: 96),
                rowButtons[i].widthAnchor.constraint(equalToConstant: 992*WIDTH_SCALING_FACTOR)
            ])
        }

    }

    @objc private func registeredPatientButtonTapped() {
        // Redirect to registered patients view controllers
        let registeredPatientsView = RegisteredPatientsView()
        registeredPatientsView.modalPresentationStyle = .fullScreen
        registeredPatientsView.clinicDataBanner = Clinics(title: sampleData[1].title, vaccine: sampleData[1].vaccine, region: sampleData[1].region, village: sampleData[1].village, registrationDate: sampleData[1].registrationDate, availableQuota: sampleData[1].availableQuota, maxQuota: sampleData[1].maxQuota, inspected: sampleData[1].inspected, admissionDate: sampleData[1].admissionDate)
        present(registeredPatientsView, animated: false, completion: nil)
    }

    @objc private func tapDeadButton(){
        print("DEBUG tapDeadButton: \(#function) \(#line)")
    }

    func createTopBannerLabels() -> UIView {
        let view = UIView(frame: CGRect(x: 85, y: 169, width: 891, height: 26))
        view.backgroundColor = gyColor

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 52, height: 26))
        titleLabel.textColor = bkColor
        titleLabel.text = "標題"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let vaccineLabel = UILabel(frame: CGRect(x: 159, y: 0, width: 100, height: 26))
        vaccineLabel.textColor = bkColor
        vaccineLabel.text = "疫苗類型"
        vaccineLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let regionLabel = UILabel(frame: CGRect(x: 316, y: 0, width: 52, height: 26))
        regionLabel.textColor = bkColor
        regionLabel.text = "區域"
        regionLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let registrationLabel = UILabel(frame: CGRect(x: 432, y: 0, width: 100, height: 26))
        registrationLabel.textColor = bkColor
        registrationLabel.text = "報名時間"
        registrationLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let quotaLabel = UILabel(frame: CGRect(x: 600, y: 0, width: 52, height: 26))
        quotaLabel.textColor = bkColor
        quotaLabel.text = "名額"
        quotaLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let passedLabel = UILabel(frame: CGRect(x: 668, y: 0, width: 100, height: 26))
        passedLabel.textColor = bkColor
        passedLabel.text = "複審通過"
        passedLabel.font = UIFont.boldSystemFont(ofSize: 24)

        let appointmentLabel = UILabel(frame: CGRect(x: 795, y: 0, width: 100, height: 26))
        appointmentLabel.textColor = bkColor
        appointmentLabel.text = "建立日期"
        appointmentLabel.font = UIFont.boldSystemFont(ofSize: 24)

        view.addSubview(titleLabel)
        view.addSubview(vaccineLabel)
        view.addSubview(regionLabel)
        view.addSubview(registrationLabel)
        view.addSubview(quotaLabel)
        view.addSubview(passedLabel)
        view.addSubview(appointmentLabel)

        return view
    }

}

