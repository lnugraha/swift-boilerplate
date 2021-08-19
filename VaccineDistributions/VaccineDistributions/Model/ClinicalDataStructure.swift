//
//  ClinicalDataStructure.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit
// Physician login credentials

// Clinical Availability
struct Clinics {
    var title: String
    var vaccine: String
    var region: String
    var village: String
    var registrationDate: String
    var availableQuota: String
    var maxQuota: String
    var inspected: String
    var admissionDate: String
}

// MARK: Size (width and height) and x-offset are immutable; y is an input argument
struct ClinicalLabels {
    var title            = UILabel()  // WIDTH: 154, HEIGHT: 50, X:  16, Y: 24
    var vaccine          = UILabel()  // WIDTH:  97, HEIGHT: 22, X: 192, Y: 36
    var region           = UILabel()  // WIDTH:  66, HEIGHT: 50, X: 376, Y: 24
    var registrationDate = UILabel()  // WIDTH: 182, HEIGHT: 50, X: 458, Y: 24
    var availableQuota   = UILabel()  // WIDTH:  70, HEIGHT: 22, X: 658, Y: 24
    var maxQuota         = UILabel()  // WIDTH:  70, HEIGHT: 22, X: 658, Y: 30
    var administered     = UILabel()  // WIDTH:  54, HEIGHT: 22, X: 758, Y: 36
    var openDate         = UILabel()  // WIDTH: 127, HEIGHT: 50, X: 848, Y: 24
}

// Registered Patients
struct Patients {
    var registrationDate: String
    var sequence: String
    var patientName : String
    var birthDate : String
    var idCard: String
    var region: String
    var registrationMethod: String
    var inspection: String
}

// Registered Patients as UILabel
struct PatientLabels {
    var date            = UILabel()            //
    var sequence        = UILabel()        //
    var name            = UILabel()            //
    var birthdate       = UILabel()       //
    var identification  = UILabel()  //
    var region          = UILabel()          //
    var registration    = UILabel()    //
    var inspection      = UILabel()      //
    var printButton     = UIButton()    //
}
