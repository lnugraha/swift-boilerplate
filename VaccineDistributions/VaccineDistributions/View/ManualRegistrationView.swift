//
//  ManualRegistrationView.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/18.
//

import Foundation
import UIKit

class ManualRegistrationView: UIViewController {

    // Declare a blank canvas
    var backgroundView = UIView(frame: CGRect(x: 212, y: 172, width: 599, height: 424))
    var idCardTextField = UITextField()

    let datePicker  = UIDatePicker()
    let yearButton  = UITextField(frame: CGRect(x: 32, y: 284, width: 599, height: 26)) // Only this part that will be used
    let monthButton = UITextField(frame: CGRect(x: 32, y: 284, width: 100, height: 26))
    let dayButton   = UITextField(frame: CGRect(x: 32, y: 284, width: 100, height: 26))

    @objc func handler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short

        // alternate example:
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        let date = formatter.date(from: "Thu, 04 Sep 2014 10:50:12 +0000")
        print("DEBUG - ManualRegistrationVC: \(#function) \(#line) \(String(describing: date))")
    }
    
    @objc func dateSelected() {
        if let datePicker = self.yearButton.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.yearButton.text = dateFormatter.string(from: datePicker.date)
        }
        datePicker.addTarget(self, action: #selector(handler(sender:)), for: .touchUpInside)
        self.yearButton.resignFirstResponder()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.yearButton.text = dateFormatter.string(from: datePicker.date)
        self.backgroundView.endEditing(true)
    }

    private func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }

    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        yearButton.inputView = datePicker
        yearButton.inputAccessoryView = createToolBar()
        yearButton.text = "選擇生日"
        yearButton.font = yearButton.font?.withSize(24.0)
        yearButton.textColor = bkColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bg_8Color
        changeColorScheme()

        let cancelButton = getCancelButton()
        let proceedButton = getProceedButton()
        let exitButton = getExitButton()
        
        self.backgroundView.addSubview(cancelButton)
        self.backgroundView.addSubview(proceedButton)
        self.backgroundView.addSubview(exitButton)

        createDatePicker()

        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView.sizeToFit()
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 600),
            backgroundView.heightAnchor.constraint(equalToConstant: 424)
        ])
        
        self.backgroundView.addSubview(yearButton)
    }
    
    private func changeColorScheme() {
        backgroundView.layer.cornerRadius = 16
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = UIColor.white
        self.view.backgroundColor = bgColor
        view.addSubview(backgroundView)
        
        let titleLabel = UILabel(frame: CGRect(x: 32, y: 36, width: 400, height: 32))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.text = "報名"
        titleLabel.textColor = priColor
        backgroundView.addSubview(titleLabel)
        
        let subTitleLabel = UILabel(frame: CGRect(x: 32, y: 88, width: 400, height: 32))
        subTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        subTitleLabel.text = "請輸入您的身分證與生日以驗證身分"
        subTitleLabel.textColor = bkColor
        backgroundView.addSubview(subTitleLabel)
        
        let namePatientLabel = UILabel(frame: CGRect(x: 32, y: 136, width: 400, height: 32))
        namePatientLabel.text = "身分證字號*"
        namePatientLabel.font = namePatientLabel.font.withSize(24)
        namePatientLabel.textColor = bkColor
        backgroundView.addSubview(namePatientLabel)

        idCardTextField.frame = CGRect(x: 32, y: 176, width: 536, height: 34)
        idCardTextField.placeholder = "請輸入您的身分證字號"
        idCardTextField.autocapitalizationType = .none
        idCardTextField.autocorrectionType = .no
        idCardTextField.font = idCardTextField.font?.withSize(24)
        idCardTextField.textColor = bkColor
        idCardTextField.layer.borderWidth = 0
        idCardTextField.layer.borderColor = UIColor.white.cgColor
        backgroundView.addSubview(idCardTextField)

        let birthDateLabel = UILabel(frame: CGRect(x: 32, y: 236, width: 400, height: 32))
        birthDateLabel.text = "生日*"
        birthDateLabel.textColor = bkColor
        birthDateLabel.font = birthDateLabel.font.withSize(24)
        backgroundView.addSubview(birthDateLabel)

        let topLine = UILabel(frame: CGRect(x: 32, y: 216, width: 536, height: 3))
        topLine.backgroundColor = bk_6Color
        backgroundView.addSubview(topLine)

        let bottomLine = UILabel(frame: CGRect(x: 32, y: 320, width: 536, height: 3))
        bottomLine.backgroundColor = bk_6Color
        backgroundView.addSubview(bottomLine)

    }

    // MARK: Buttons declaration and implementation
    private func getExitButton() -> UIButton {
        let exitButton = UIButton(frame: CGRect(x: 528, y: 32, width: 40, height: 40))
        let exitImage = UIImage(named: "common_cancel")
        exitButton.setImage(exitImage, for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return exitButton
    }

    @objc func exitButtonTapped() {
        let registrationSelectionVC = RegistrationSelectionView()
        registrationSelectionVC.modalPresentationStyle = .fullScreen
        present(registrationSelectionVC, animated: false, completion: nil)
    }

    private func getCancelButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 352, width: 300, height: 72))
        button.setTitle("取消", for: .normal)
        button.backgroundColor = bkColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24)
        button.layer.cornerRadius = 16
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }

    private func getProceedButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 300, y: 352, width: 300, height: 72))
        button.setTitle("下一步", for: .normal)
        button.backgroundColor = priColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(24)
        button.layer.cornerRadius = 16
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc func proceedButtonTapped() {
        print("DEBUG from ManualRegistrationVC: \(#function) \(#line)")
        if idCardTextField.text == nil || idCardTextField.text == "" || yearButton.text == nil || yearButton.text == "" {
            // TODO: Create a warning message and prevent users from going any further if any of the birthdate or id number field is empty
            // Create a warning text message under the birthdate text field
            print("DEBUG Do not leave a blank text field")

        } else if idCardTextField.text == "AAAAAAAAAA" {

            // let previousRegistrationVC = PreviousRegistrationVC()
            // previousRegistrationVC.modalPresentationStyle = .fullScreen
            // present(previousRegistrationVC, animated: false, pushing: true, completion: nil)

        } else {

            let agreementFormVC = AgreementFormView()
            agreementFormVC.modalPresentationStyle = .fullScreen
            agreementFormVC.checkIdNumber = idCardTextField.text!
            agreementFormVC.checkBirthDate = yearButton.text!
            present(agreementFormVC, animated: false, completion: nil)

        } // end-if
    }

}
