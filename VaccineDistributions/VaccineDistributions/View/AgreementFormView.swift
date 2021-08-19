//
//  AgreementFormView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/18.
//

import Foundation
import UIKit
import CoreData

struct CovidPatient {
    var sequence = Int()            // 序號
    var identification = String()   // 身分證
    var name = String()             // 姓名
    var registration = String()     // 報名方式
    var inspection = Bool()         // 複檢結果 (- or 已取消)
    var region = Bool()             // 戶籍 (北市 or 非北市)
    var birthdate = Date()          // 生日
    var date = Date()               // 報名時間 (Date and Time)
}

class AgreementFormView: UIViewController {
    let FIXED_WIDTH = 536; let FIXED_X_POSITION = 32
    var checkIdNumber: String = ""; var checkBirthDate: String = ""

    private var checked = false // Switch this boolean variable label to true if patient has agreed to receive vaccine jabs

    private lazy var warningMessageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 32, y: 1048, width: 536, height: 28))
        label.font = label.font.withSize(24.0)
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.red
        return label
    }()

    private lazy var backgroundScrollView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 212, y: 40, width: 600, height: 1152))
        view.contentSize = CGSize(width: 600, height: 1535)// 600 1535
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bg_8Color
        self.view.addSubview(backgroundScrollView)
        changeColorScheme()

        backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundScrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            backgroundScrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundScrollView.widthAnchor.constraint(equalToConstant: 600),
            backgroundScrollView.heightAnchor.constraint(equalToConstant: 1152)
        ])

    }

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: CGRect(x: FIXED_X_POSITION, y: 232, width: FIXED_WIDTH, height: 24))
        nameTextField.placeholder = "請輸入姓名"
        nameTextField.textColor = bk_6Color
        nameTextField.font = nameTextField.font?.withSize(24.0)
        return nameTextField
    }()

    private func changeColorScheme() {
        // Title and immutable texts are declared here
        let titleLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 41, width: FIXED_WIDTH, height: 42))
        titleLabel.text = "活動報名"
        titleLabel.textColor = priColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)

        let serviceLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 112, width: FIXED_WIDTH, height: 24))
        serviceLabel.text = "臺北市政府衛生局公費疫苗社區設站接種服務"
        serviceLabel.textColor = bkColor
        serviceLabel.font = serviceLabel.font.withSize(24.0)

        let regionLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 143, width: FIXED_WIDTH, height: 24))
        regionLabel.text = "內湖區－西康里 | 新冠肺炎"
        regionLabel.textColor = bk_6Color
        regionLabel.font = regionLabel.font.withSize(24.0)

        let nameLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 192, width: FIXED_WIDTH, height: 24))
        nameLabel.text = "姓名*"
        nameLabel.textColor = bkColor
        nameLabel.font = nameLabel.font.withSize(24.0)

        let idNumberLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 289, width: FIXED_WIDTH, height: 24))
        idNumberLabel.text = "身分證字號*"
        idNumberLabel.textColor = bkColor
        idNumberLabel.font = idNumberLabel.font.withSize(24.0)

        let idNumberTextField = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 328, width: FIXED_WIDTH, height: 24))
        idNumberTextField.text = self.checkIdNumber
        idNumberTextField.textColor = bkColor
        idNumberTextField.font = idNumberTextField.font?.withSize(24.0)
        
        let birthdateLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 384, width: FIXED_WIDTH, height: 24))
        birthdateLabel.text = "生日*"
        birthdateLabel.textColor = bkColor
        birthdateLabel.font = birthdateLabel.font.withSize(24.0)

        let year = String(self.checkBirthDate.suffix(4))
        let monthText = String(self.checkBirthDate.prefix(3))
        var monthNum = String("1")
        
        switch monthText {
        case "Jan":
            monthNum = "1"
        case "Feb":
            monthNum = "2"
        case "Mar":
            monthNum = "3"
        case "Apr":
            monthNum = "4"
        case "May":
            monthNum = "5"
        case "Jun":
            monthNum = "6"
        case "Jul":
            monthNum = "7"
        case "Aug":
            monthNum = "8"
        case "Sep":
            monthNum = "9"
        case "Oct":
            monthNum = "10"
        case "Nov":
            monthNum = "11"
        case "Dec":
            monthNum = "12"
        default:
            monthNum = "1"
        }

        let day = String(self.checkBirthDate.dropLast(6).suffix(2))

        let yearBirthdateLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 424, width: 100, height: 24))
        yearBirthdateLabel.textColor = bkColor
        yearBirthdateLabel.font = yearBirthdateLabel.font.withSize(24.0)
        yearBirthdateLabel.text = year + " 年"

        let monthBirthdateLabel = UILabel(frame: CGRect(x: 230, y: 424, width: 100, height: 24))
        monthBirthdateLabel.textColor = bkColor
        monthBirthdateLabel.font = monthBirthdateLabel.font.withSize(24.0)
        monthBirthdateLabel.text = monthNum + " 月"

        let dayBirthdateLabel = UILabel(frame: CGRect(x: 428, y: 424, width: 100, height: 24))
        dayBirthdateLabel.textColor = bkColor
        dayBirthdateLabel.font = dayBirthdateLabel.font.withSize(24.0)
        dayBirthdateLabel.text = day + " 日"

        backgroundScrollView.addSubview(yearBirthdateLabel)
        backgroundScrollView.addSubview(monthBirthdateLabel)
        backgroundScrollView.addSubview(dayBirthdateLabel)

        let telephoneLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 488, width: FIXED_WIDTH, height: 24))
        telephoneLabel.text = "電話*"
        telephoneLabel.textColor = bkColor
        telephoneLabel.font = telephoneLabel.font.withSize(24.0)

        let telephoneTextField = UITextField(frame: CGRect(x: FIXED_X_POSITION, y: 528, width: FIXED_WIDTH, height: 24))
        telephoneTextField.placeholder = "請輸入電話號碼"
        telephoneTextField.textColor = bk_6Color
        telephoneTextField.font = telephoneTextField.font?.withSize(24.0)
        
        let domicileLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 584, width: FIXED_WIDTH, height: 24))
        domicileLabel.text = "戶籍"
        domicileLabel.textColor = bkColor
        domicileLabel.font = regionLabel.font.withSize(24.0)

        let localDomicileLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 624, width: FIXED_WIDTH, height: 24))
        localDomicileLabel.text = "本市民 （原）"
        localDomicileLabel.textColor = bkColor
        localDomicileLabel.font = localDomicileLabel.font.withSize(24.0)
        
        let vaccineLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 680, width: FIXED_WIDTH, height: 24))
        vaccineLabel.text = "報名接種"
        vaccineLabel.textColor = bkColor
        vaccineLabel.font = idNumberLabel.font.withSize(24.0)
        
        let AZVaccineLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 720, width: FIXED_WIDTH, height: 24))
        AZVaccineLabel.text = "● AstraZeneca(AZ)"
        AZVaccineLabel.textColor = bkColor
        AZVaccineLabel.font = AZVaccineLabel.font.withSize(24.0)

        let declarationTitle = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 792, width: FIXED_WIDTH, height: 24))
        declarationTitle.text = "活動申明"
        declarationTitle.textColor = bkColor
        declarationTitle.font = declarationTitle.font.withSize(24.0)
        
        let declarationLabel = UILabel(frame: CGRect(x: FIXED_X_POSITION, y: 848, width: FIXED_WIDTH, height: 136))
        declarationLabel.layer.cornerRadius = 8
        declarationLabel.clipsToBounds = true
        declarationLabel.backgroundColor = bk_6Color
        let contentLabel = UILabel(frame: CGRect(x: 16, y: 24, width: 512, height: 96))
        contentLabel.text = "為避免重複接種，報名後請勿再自行前往院所接\n種或跨里報名，接種當日，將再次檢核接種資\n格，屆時依現場判讀可接種之疫苗別為準。"
        contentLabel.textColor = bkColor
        contentLabel.font = declarationLabel.font.withSize(24.0)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping

        let agreementLabel = UILabel(frame: CGRect(x: 81, y: 1006, width: 400, height: 28))
        agreementLabel.text = "我同意以上申請*"
        agreementLabel.textColor = bkColor
        agreementLabel.font = agreementLabel.font.withSize(24.0)
        backgroundScrollView.addSubview(agreementLabel)

        // MARK: Separator lines are declared here
        let X_SEPARATOR_OFFSET = 32; let SEPARATOR_HEIGHT = 2; let SEPARATOR_WIDTH = 536

        let nameSeparator = UILabel(frame: CGRect(x: X_SEPARATOR_OFFSET, y: 264, width: SEPARATOR_WIDTH, height: SEPARATOR_HEIGHT))
        nameSeparator.backgroundColor = bk_6Color

        let idNumberSeparator = UILabel(frame: CGRect(x: X_SEPARATOR_OFFSET, y: 360, width: SEPARATOR_WIDTH, height: SEPARATOR_HEIGHT))
        idNumberSeparator.backgroundColor = bk_6Color

        let yearDateSeparator = UILabel(frame: CGRect(x: 32, y: 464, width: 140, height: SEPARATOR_HEIGHT))
        yearDateSeparator.backgroundColor = bk_6Color
        let monthDateSeparator = UILabel(frame: CGRect(x: 230, y: 464, width: 140, height: SEPARATOR_HEIGHT))
        monthDateSeparator.backgroundColor = bk_6Color
        let dayDateSeparator = UILabel(frame: CGRect(x: 428, y: 464, width: 140, height: SEPARATOR_HEIGHT))
        dayDateSeparator.backgroundColor = bk_6Color

        let yearMonthSeparator = UILabel(frame: CGRect(x: 196, y: 424, width: 10, height: 28))
        yearMonthSeparator.backgroundColor = UIColor.white
        yearMonthSeparator.textColor = bk_6Color
        yearMonthSeparator.font = yearMonthSeparator.font.withSize(24.0)
        yearMonthSeparator.text = "/"

        let monthDaySeparator = UILabel(frame: CGRect(x: 394, y: 424, width: 10, height: 28))
        monthDaySeparator.backgroundColor = UIColor.white
        monthDaySeparator.textColor = bk_6Color
        monthDaySeparator.font = monthDaySeparator.font.withSize(24.0)
        monthDaySeparator.text = "/"

        let phoneNumberSeparator = UILabel(frame: CGRect(x: X_SEPARATOR_OFFSET, y: 560, width: SEPARATOR_WIDTH, height: SEPARATOR_HEIGHT))
        phoneNumberSeparator.backgroundColor = bk_6Color
        let cityRegionSeparator = UILabel(frame: CGRect(x: X_SEPARATOR_OFFSET, y: 656, width: SEPARATOR_WIDTH, height: SEPARATOR_HEIGHT))
        cityRegionSeparator.backgroundColor = bk_6Color
        let vaccineNameSeparator = UILabel(frame: CGRect(x: X_SEPARATOR_OFFSET, y: 768, width: SEPARATOR_WIDTH, height: SEPARATOR_HEIGHT))
        vaccineNameSeparator.backgroundColor = bk_6Color

        backgroundScrollView.addSubview(nameSeparator)
        backgroundScrollView.addSubview(idNumberSeparator)

        backgroundScrollView.addSubview(yearDateSeparator)
        backgroundScrollView.addSubview(yearMonthSeparator)
        backgroundScrollView.addSubview(monthDateSeparator)
        backgroundScrollView.addSubview(monthDaySeparator)
        backgroundScrollView.addSubview(dayDateSeparator)

        backgroundScrollView.addSubview(phoneNumberSeparator)
        backgroundScrollView.addSubview(cityRegionSeparator)
        backgroundScrollView.addSubview(vaccineNameSeparator)

        backgroundScrollView.addSubview(warningMessageLabel)

        // Buttons are placed here
        let cancelButton = getCancelButton()
        backgroundScrollView.addSubview(cancelButton)
        let proceedButton = getProceedButton()
        backgroundScrollView.addSubview(proceedButton)
        let exitButton = getExitButton()
        backgroundScrollView.addSubview(exitButton)

        // CHECKBUTTON FUNCTIONALITY
        let checkButton = UIButton(frame: CGRect(x: 32, y: 1000, width: 40, height: 40))
        checkButton.setImage(UIImage(named: "Component 125 – 3"), for: .normal) // blank
        checkButton.setImage(UIImage(named: "Component 126 – 5"), for: .selected) // selected
        checkButton.addTarget(self, action: #selector(checkButtonTapped(sender:)), for: .touchUpInside)
        backgroundScrollView.addSubview(checkButton)

        // Mutable labels are declared here
        backgroundScrollView.addSubview(nameTextField)
        backgroundScrollView.addSubview(idNumberTextField)
        backgroundScrollView.addSubview(telephoneTextField)

        // Appending UI Elements here
        backgroundScrollView.addSubview(titleLabel)
        backgroundScrollView.addSubview(serviceLabel)
        backgroundScrollView.addSubview(regionLabel)

        backgroundScrollView.addSubview(idNumberLabel)
        backgroundScrollView.addSubview(nameLabel)
        backgroundScrollView.addSubview(birthdateLabel)
        backgroundScrollView.addSubview(telephoneLabel)
        backgroundScrollView.addSubview(domicileLabel)
        backgroundScrollView.addSubview(localDomicileLabel)
        backgroundScrollView.addSubview(vaccineLabel)
        backgroundScrollView.addSubview(AZVaccineLabel)

        declarationLabel.addSubview(contentLabel)
        backgroundScrollView.addSubview(declarationTitle)
        backgroundScrollView.addSubview(declarationLabel)
    }

    private func getExitButton() -> UIButton {
        let exitButton = UIButton()
        exitButton.frame = CGRect(x: 528, y: 41, width: 40, height: 40)
        let common_cancel = UIImage(named: "common_cancel")
        exitButton.setImage(common_cancel, for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        return exitButton
    }

    private func getCancelButton() -> UIButton {
        // Attach the cancel button to the panel, not the background
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 1080, width: 300, height: 72))
        cancelButton.layer.cornerRadius = 16
        cancelButton.layer.maskedCorners = [.layerMinXMaxYCorner]
        cancelButton.clipsToBounds = true
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.backgroundColor = bkColor
        cancelButton.setTitleColor(UIColor.white, for: .normal)
        cancelButton.titleLabel?.font = cancelButton.titleLabel?.font.withSize(24)
        // Action of the cancel button
        cancelButton.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        return cancelButton
    }

    private func getProceedButton() -> UIButton {
        let proceedButton = UIButton(frame: CGRect(x: 300, y: 1080, width: 300, height: 72))
        proceedButton.layer.cornerRadius = 16
        proceedButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
        proceedButton.clipsToBounds = true
        proceedButton.setTitle("下一步", for: .normal)
        proceedButton.backgroundColor = priColor
        proceedButton.setTitleColor(UIColor.white, for: .normal)
        proceedButton.titleLabel?.font = proceedButton.titleLabel?.font.withSize(24)
        // Action Button of the proceed button
        proceedButton.addTarget(self, action: #selector(proceedButtonPressed), for: .touchUpInside)
        return proceedButton
    }

    @objc private func exitButtonPressed() {
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    @objc private func proceedButtonPressed() {
        print("DEBUG from COVIDAgreementForm: \(#function) \(#line)")
        
        if checked == true {

            let successfulRegistrationVC = RegistrationSuccessful()
            successfulRegistrationVC.modalPresentationStyle = .fullScreen
            present(successfulRegistrationVC, animated: false, completion: nil)

        } else {
            warningMessageLabel.text = "不同意的話沒辦法按『下一步』。"

        } // end-if
    }

    @objc private func checkButtonTapped(sender: UIButton?) {
        if let button = sender {
            if button.isSelected {
                button.isSelected = false
                self.checked = false
            } else {
                button.isSelected = true
                self.checked = true
            } // end-if button.isSelected
        } // end-if var button
        
    }

}
