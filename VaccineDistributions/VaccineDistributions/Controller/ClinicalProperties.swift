//
//  ClinicalProperties.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/14.
//

import Foundation
import UIKit

class ClinicalProperties {

    // MARK: Bundle necessary labels related to the vaccine availability and clinic data to UIButton
    public class func createClinicLabels(yPosition: Float, clinics: Clinics) -> ClinicalLabels {
        var rawLabels       = ClinicalLabels()
        let availability    = Int(clinics.availableQuota)
        let maximum         = Int(clinics.maxQuota)
        
        rawLabels.title = UILabel(frame: CGRect(x: 16, y: Int(yPosition), width: 170, height: 60))
        rawLabels.title.text = clinics.title
        rawLabels.title.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.title.numberOfLines = 0
        rawLabels.title.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        rawLabels.vaccine = UILabel(frame: CGRect(x: 192, y: Int(yPosition), width: 170, height: 60))
        rawLabels.vaccine.text = clinics.vaccine
        rawLabels.vaccine.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.vaccine.numberOfLines = 0
        rawLabels.vaccine.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        rawLabels.region = UILabel(frame: CGRect(x: 376, y: Int(yPosition), width: 66, height: 60))
        rawLabels.region.text = clinics.region + "\n" + clinics.village
        rawLabels.region.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.region.numberOfLines = 0
        rawLabels.region.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabels.registrationDate = UILabel(frame: CGRect(x: 458, y: Int(yPosition), width: 200, height: 60))
        rawLabels.registrationDate.text = clinics.registrationDate
        rawLabels.registrationDate.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.registrationDate.numberOfLines = 0
        rawLabels.registrationDate.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabels.availableQuota = UILabel(frame: CGRect(x: 658, y: Int(yPosition), width: 70, height: 22))
        rawLabels.availableQuota.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.availableQuota.numberOfLines = 0
        rawLabels.availableQuota.textAlignment = NSTextAlignment.right
        rawLabels.availableQuota.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabels.maxQuota = UILabel(frame: CGRect(x: 658, y: Int(yPosition+30.0), width: 70, height: 22))
        rawLabels.maxQuota.font = UIFont.systemFont(ofSize: 22.0)
        rawLabels.maxQuota.numberOfLines = 0
        rawLabels.maxQuota.textAlignment = NSTextAlignment.right
        rawLabels.maxQuota.lineBreakMode = NSLineBreakMode.byWordWrapping

        if availability! == maximum! {
            rawLabels.availableQuota.text       = "名額"
            rawLabels.maxQuota.text             = "已滿"
            rawLabels.availableQuota.textColor  = bk_4Color
            rawLabels.maxQuota.textColor        = bk_4Color
        } else {
            rawLabels.availableQuota.text       = clinics.availableQuota
            rawLabels.maxQuota.text             = "/" + clinics.maxQuota
            rawLabels.maxQuota.textColor        = bk_4Color
        }

        rawLabels.administered = UILabel(frame: CGRect(x: 758, y: Int(yPosition+12.0), width: 54, height: 22))
        rawLabels.administered.text = clinics.inspected
        rawLabels.administered.font = rawLabels.administered.font.withSize(22.0)
        rawLabels.administered.numberOfLines = 0
        rawLabels.administered.textAlignment = NSTextAlignment.right
        rawLabels.administered.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabels.openDate = UILabel(frame: CGRect(x: 848, y: Int(yPosition), width: 140, height: 60))
        rawLabels.openDate.text = clinics.admissionDate
        rawLabels.openDate.font = rawLabels.openDate.font.withSize(22.0)
        rawLabels.openDate.numberOfLines = 0
        rawLabels.openDate.lineBreakMode = NSLineBreakMode.byWordWrapping

        if availability! == 0 || availability! == maximum {
            rawLabels.title.textColor               = bk_4Color
            rawLabels.vaccine.textColor             = bk_4Color
            rawLabels.region.textColor              = bk_4Color
            rawLabels.registrationDate.textColor    = bk_4Color
            rawLabels.availableQuota.textColor      = bk_4Color
            rawLabels.administered.textColor        = bk_4Color
            rawLabels.openDate.textColor            = bk_4Color
        } else {
            rawLabels.title.textColor               = bkColor
            rawLabels.vaccine.textColor             = bkColor
            rawLabels.region.textColor              = bkColor
            rawLabels.registrationDate.textColor    = bkColor
            rawLabels.availableQuota.textColor      = bkColor
            rawLabels.administered.textColor        = bkColor
            rawLabels.openDate.textColor            = bkColor
        }

        return rawLabels
    }

    public class func createPatientLabels(yPosition: Int, patients: Patients) -> PatientLabels {
        var rawLabel = PatientLabels()

        rawLabel.date = UILabel(frame: CGRect(x: 18, y: yPosition, width: 150, height: 60))
        rawLabel.date.text = patients.registrationDate
        rawLabel.date.textColor = bkColor
        rawLabel.date.font = rawLabel.sequence.font.withSize(24.0)
        rawLabel.date.numberOfLines = 0
        rawLabel.date.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabel.sequence = UILabel(frame: CGRect(x: 174, y: yPosition+15, width: 65, height: 26))
        rawLabel.sequence.text = patients.sequence
        rawLabel.sequence.textColor = bkColor
        rawLabel.sequence.font = rawLabel.sequence.font.withSize(24.0)

        rawLabel.name = UILabel(frame: CGRect(x: 252, y: yPosition+15, width: 72, height: 26))
        rawLabel.name.text = patients.patientName
        rawLabel.name.textColor = bkColor
        rawLabel.name.font = rawLabel.sequence.font.withSize(24.0)

        rawLabel.birthdate = UILabel(frame: CGRect(x: 349, y: yPosition, width: 80, height: 60))
        rawLabel.birthdate.text = patients.birthDate
        rawLabel.birthdate.textColor = bkColor
        rawLabel.birthdate.font = rawLabel.birthdate.font.withSize(24.0)
        rawLabel.birthdate.numberOfLines = 0
        rawLabel.birthdate.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabel.identification = UILabel(frame: CGRect(x: 437, y: yPosition, width: 100, height: 60))
        rawLabel.identification.text = patients.idCard
        rawLabel.identification.textColor = bkColor
        rawLabel.identification.font = rawLabel.identification.font.withSize(24.0)
        rawLabel.identification.numberOfLines = 0
        rawLabel.identification.lineBreakMode = NSLineBreakMode.byWordWrapping

        rawLabel.region = UILabel(frame: CGRect(x: 536, y: yPosition+15, width: 72, height: 26))
        rawLabel.region.text = patients.region
        rawLabel.region.textColor = bkColor
        rawLabel.region.font = rawLabel.region.font.withSize(24.0)

        rawLabel.registration = UILabel(frame: CGRect(x: 624, y: yPosition+15, width: 150, height: 26))
        rawLabel.registration.text = patients.registrationMethod
        rawLabel.registration.textColor = bkColor
        rawLabel.registration.font = rawLabel.registration.font.withSize(24.0)

        rawLabel.inspection = UILabel(frame: CGRect(x: 749, y: yPosition+15, width: 90, height: 26))
        rawLabel.inspection.text = patients.inspection
        rawLabel.inspection.textColor = bkColor
        rawLabel.inspection.font = rawLabel.inspection.font.withSize(24.0)

        var buttonSelectability: Bool = true // determine the button selectability
        if rawLabel.inspection.text == "已取消" {
            rawLabel.date.textColor             = bk_6Color
            rawLabel.sequence.textColor         = bk_6Color
            rawLabel.name.textColor             = bk_6Color
            rawLabel.birthdate.textColor        = bk_6Color
            rawLabel.identification.textColor   = bk_6Color
            rawLabel.region.textColor           = bk_6Color
            rawLabel.registration.textColor     = bk_6Color
            rawLabel.inspection.textColor       = bk_6Color
            buttonSelectability = false
        }

        rawLabel.printButton = ClinicalProperties.printButton(x: 836, y: yPosition, selectable: buttonSelectability)
        return rawLabel
    }
    
    public class func appendLabelsToButton(clinicalLabel: ClinicalLabels, rowButton: inout UIButton) {
        rowButton.addSubview(clinicalLabel.title)
        rowButton.addSubview(clinicalLabel.vaccine)
        rowButton.addSubview(clinicalLabel.region)
        rowButton.addSubview(clinicalLabel.registrationDate)
        rowButton.addSubview(clinicalLabel.availableQuota)
        rowButton.addSubview(clinicalLabel.maxQuota)
        rowButton.addSubview(clinicalLabel.administered)
        rowButton.addSubview(clinicalLabel.openDate)
    }
    
    // MARK: Create a registration button
    
    // MARK: Create a print button
    class public func printButton(x: Int, y: Int, selectable: Bool) -> UIButton {
        let printButton = UIButton(); let BUTTON_HEIGHT = 56; let BUTTON_WIDTH = 144
        printButton.frame = CGRect(x: x, y: y, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
        printButton.layer.cornerRadius = 8
        printButton.clipsToBounds = true

        // Include Image
        let printImageView = UIImageView(image: UIImage(systemName: "printer.fill.and.paper.fill"))
        printImageView.frame = CGRect(x: 16, y: 16, width: 24, height: 24)
        printImageView.tintColor = bkColor
        printButton.addSubview(printImageView)

        // Include Text
        let printCommand = UILabel(frame: CGRect(x:50, y:16, width: 90, height:24))
        printCommand.text = "列印標鐵"
        printCommand.font = printCommand.font.withSize(18.0)
        printButton.addSubview(printCommand)

        if selectable == false {
            printButton.backgroundColor = gyColor
            printCommand.textColor = bkColor
        } else {
            printButton.backgroundColor = priColor
            printCommand.textColor = UIColor.white
            printImageView.tintColor = UIColor.white
            // Direct immediately to another view controller to print the sticker
            // printButton.addTarget(nil, action: #selector(DirectiveFunctions.didTapDeadButton), for: .touchUpInside)
        }
        return printButton
    }

}

class ClinicTableCells {
    
    // MARK: Create a blank UIButton that acts as a container for UILabels for registered clinics for vaccine appointment
    class public func addClinicalDataLabel(position: Int) -> UIButton {
        let TABLECELL_HEIGHT = 96.0; let TABLECELL_WIDTH = 992.0
        let rowButton = UIButton()
        rowButton.backgroundColor = UIColor.white
        rowButton.frame = CGRect(x: 16.0, y: 208.0 + Double(112*position), width: TABLECELL_WIDTH, height: TABLECELL_HEIGHT)
        rowButton.layer.cornerRadius = 16
        rowButton.clipsToBounds = true
        return rowButton
    }
    
    // MARK: This button is dedicated for displaying all patients that have registered for vaccine appointment
    class public func registeredPatientCell(position: Int) -> UIButton {
        let registeredPatient = UIButton(frame: CGRect(x: 16, y: (287 + position*112), width: 992, height: 96))
        registeredPatient.backgroundColor = UIColor.white
        registeredPatient.layer.cornerRadius = 16
        registeredPatient.clipsToBounds = true
        return registeredPatient
    }

    // MARK: Append all necessary registered patient labels to the button cell
    class public func appendLabelsToButton(patientLabels: PatientLabels, rowButton: inout UIButton) {
        rowButton.addSubview(patientLabels.date)
        rowButton.addSubview(patientLabels.sequence)
        rowButton.addSubview(patientLabels.name)
        rowButton.addSubview(patientLabels.birthdate)
        rowButton.addSubview(patientLabels.identification)
        rowButton.addSubview(patientLabels.region)
        rowButton.addSubview(patientLabels.registration)
        rowButton.addSubview(patientLabels.inspection)
        rowButton.addSubview(patientLabels.printButton)

    }

    class public func topBannerTitle(quota: Int, max: Int, inspected: Int, clinicName: String, clinicRegion: String, vaccineName: String, implementationDateTime: String, registrationDateTime: String, forCovid: Bool) -> UILabel {
        let fullLabel = UILabel()       // House for both labels below
        let warningLabel = UILabel()    // When appointment has exceeded quota
        let bannerLabel = UILabel()     // Clinic name
        let regionLabel = UILabel()     // Clinic address
        let vacantLabel = UILabel()     // 開放名額
        let inspectLabel = UILabel()    // 複檢通過人數
        let vaccineLabel = UILabel()    // 疫苗廠牌：
        let setupDate = UILabel()       // 設站起訖時間：
        let registrationDate = UILabel()// 報名開放起迄時間：
        vaccineLabel.frame = CGRect(x: 88, y: 96, width: 445, height: 16)
        vaccineLabel.textColor = UIColor.white
        vaccineLabel.font = UIFont(name:"Arial", size:16.0)

        setupDate.frame = CGRect(x: 88, y: 114, width: 445, height: 16)
        setupDate.textColor = UIColor.white
        setupDate.font = UIFont(name:"Arial", size:16.0)

        registrationDate.frame = CGRect(x: 88, y: 132, width: 445, height: 16)
        registrationDate.textColor = UIColor.white
        registrationDate.font = UIFont(name:"Arial", size:16.0)

        if forCovid == true {
            vaccineLabel.text = "疫苗廠牌：\(vaccineName)"
            setupDate.text = "設站起訖時間：\(implementationDateTime)"
            registrationDate.text = "報名開放起迄時間：\(registrationDateTime)"
        } else {
            vaccineLabel.text = ""
            setupDate.text = "設站起訖時間：\(implementationDateTime)"
            registrationDate.text = "報名開放起迄時間：\(registrationDateTime)"
        }

        fullLabel.addSubview(vaccineLabel)
        fullLabel.addSubview(setupDate)
        fullLabel.addSubview(registrationDate)
        // =========================================================
        fullLabel.numberOfLines = 0
        fullLabel.lineBreakMode = NSLineBreakMode.byWordWrapping

        bannerLabel.font = UIFont(name:"Arial", size:24.0)
        bannerLabel.text = clinicName
        regionLabel.font = UIFont(name:"Arial", size:16.0)
        regionLabel.text = clinicRegion

        vacantLabel.frame = CGRect(x: 836, y: 24, width: 160, height: 20)
        vacantLabel.font = UIFont(name:"Arial", size:16.0)
        vacantLabel.textColor = UIColor.white
        vacantLabel.text = "開放名額：" + String(quota) + "/" + String(max)

        inspectLabel.frame = CGRect(x: 836, y: 51, width: 160, height: 20)
        inspectLabel.font = UIFont(name:"Arial", size:16.0)
        inspectLabel.textColor = UIColor.white
        inspectLabel.text = "複檢通過人數：" + String(inspected)

        if quota >= max {
            // Quota has been full
            warningLabel.backgroundColor = danColor
            warningLabel.frame = CGRect(x: 88, y: 24, width: 144, height: 48)
            warningLabel.textColor = priColor
            warningLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
            warningLabel.text = "名額已滿！"
            warningLabel.textAlignment = NSTextAlignment.center
            bannerLabel.frame = CGRect(x: 256, y: 24, width: 860, height: 24)
            regionLabel.frame = CGRect(x: 256, y: 56, width: 860, height: 18)
        } else {
            // There are still some quota left
            warningLabel.backgroundColor = priColor
            warningLabel.textColor = priColor
            warningLabel.font = UIFont.systemFont(ofSize: 24)
            warningLabel.frame = CGRect(x: 88, y: 24, width: 0, height: 0)
            warningLabel.text = ""
            bannerLabel.frame = CGRect(x: 88, y: 24, width: 860, height: 24)
            regionLabel.frame = CGRect(x: 88, y: 56, width: 860, height: 18)
        }

        bannerLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        regionLabel.font = UIFont.boldSystemFont(ofSize: 16.0)

        bannerLabel.textColor = UIColor.white
        regionLabel.textColor = UIColor.white

        fullLabel.addSubview(regionLabel)
        fullLabel.addSubview(warningLabel)
        fullLabel.addSubview(bannerLabel)

        bannerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerLabel.leadingAnchor.constraint(equalTo: fullLabel.leadingAnchor, constant: 88),
            bannerLabel.topAnchor.constraint(equalTo: fullLabel.topAnchor, constant: 40),
            bannerLabel.widthAnchor.constraint(equalToConstant: 860),
            bannerLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regionLabel.leadingAnchor.constraint(equalTo: fullLabel.leadingAnchor, constant: 88),
            regionLabel.topAnchor.constraint(equalTo: bannerLabel.bottomAnchor, constant: 8),
            regionLabel.widthAnchor.constraint(equalToConstant: 860),
            regionLabel.heightAnchor.constraint(equalToConstant: 18)
        ])

        fullLabel.addSubview(vacantLabel)
        fullLabel.addSubview(inspectLabel)
        
        vacantLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vacantLabel.trailingAnchor.constraint(equalTo: fullLabel.trailingAnchor, constant: FULL_WIDTH-48),
            vacantLabel.topAnchor.constraint(equalTo: fullLabel.topAnchor, constant: 40),
            vacantLabel.widthAnchor.constraint(equalToConstant: 160),
            vacantLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        inspectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inspectLabel.trailingAnchor.constraint(equalTo: fullLabel.trailingAnchor, constant: FULL_WIDTH-48),
            inspectLabel.topAnchor.constraint(equalTo: vacantLabel.bottomAnchor, constant: 11),
            inspectLabel.widthAnchor.constraint(equalToConstant: 160),
            inspectLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        return fullLabel
    }

}
