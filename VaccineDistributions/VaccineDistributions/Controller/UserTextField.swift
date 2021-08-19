//
//  UserTextField.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/14.
//

import Foundation
import UIKit


// TODO: Create a customized object that combine the behavior of both UIView and UITextField
// Make sure that the aggregated object can return the content of the text field
class UserTextField {

    private var borderTextField = UIView()
    private var textField = UITextField()
    var textFieldContent = String()
    
    public func getUserTextField(x: Int, y: Int, width: Int, height: Int, font: CGFloat, placeHolder: String, secureText: Bool=false) -> UIView {
        borderTextField = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        borderTextField.layer.cornerRadius = 8
        borderTextField.backgroundColor = whiteColor
        borderTextField.clipsToBounds = true
        borderTextField.layer.borderWidth = 1
        borderTextField.layer.borderColor = edgeColor.cgColor
        
        textField = UITextField(frame: CGRect(x: 16, y: 16, width: width-32, height: height-32))
        textField.textColor = bkColor
        textField.font = UIFont.systemFont(ofSize: font)
        textField.backgroundColor = whiteColor
        textField.placeholder = placeHolder
        
        self.textFieldContent = textField.text!
        borderTextField.addSubview(textField)
        return borderTextField
    }

    public func getStringTextField() -> String {
        return textFieldContent
    }
}
