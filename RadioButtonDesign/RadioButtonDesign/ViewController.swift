//
//  ViewController.swift
//  RadioButtonDesign
//
//  Created by Leo Nugraha on 2021/7/26.
//

import UIKit

class ViewController: UIViewController {

    private var checked = false // The value changes each time the button is toggled

    // MARK - The agreement label
    private lazy var agreementLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        label.text = "By clicking the button on the left you have agreed with our terms and conditions"
        return label
    }()

    // MARK - The radio button which can able toggled to express agreement
    private lazy var radioButton: UIButton = {
        let radio = UIButton(frame: CGRect(x: 100, y: 200, width: 30, height: 30))
        radio.tintColor = UIColor.red
        radio.setImage(UIImage(named: "circle"), for: .normal) // blank
        radio.setImage(UIImage(named: "filled_circle"), for: .selected) // selected
        radio.addTarget(self, action: #selector(radioButtonTapped(sender:)), for: .touchUpInside)
        return radio
    }()
    
    @objc func radioButtonTapped(sender: UIButton?) {
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

    // MARK - Warning message that will pop out when users
    private lazy var warningLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 500, width: 400, height: 28))
        label.text = ""
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 500, width: 400, height: 60))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.green
        button.clipsToBounds = true
        button.setTitle("Tap Here To Proceed", for: .normal)
        // Do not proceed to the next view controller if users have not agreed with terms and conditions
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func proceedButtonTapped() {
        print("DEBUG - \(#function) \(#line)")
        if checked == true {
            let nextViewController = NextViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            present(nextViewController, animated: false, completion: nil)
        } else {
            warningLabel.text = "You cannot proceed to the next page unless you have checked the button above"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(radioButton)
        self.view.addSubview(agreementLabel)
        self.view.addSubview(proceedButton)
        self.view.addSubview(warningLabel)
        // Do not proceed to the next view controller if the radio button has not been checked
        
    }


}

