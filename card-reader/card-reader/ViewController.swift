//
//  ViewController.swift
//  card-reader
//
//  Created by Leo Nugraha on 2021/2/22.
//

import UIKit
import Vision
import Photos

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        image = info[.originalImage] as? UIImage
        processImage()
    }
    
}

/**
    A class that encapsulates all members of a particular tag
    1. **x**: The starting position of the text in horizontal position
    2. **y**: The starting position of the text in vertical position
    3. **text**: The text that has been captured and deciphered by Core ML Neural Engine
 */
class CardComponent: NSObject {
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var text = ""
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var image: UIImage? /// The employee badge that is being processed by Apple Neural Engine
    @IBOutlet weak var nameEmployee: UILabel! /// The name of the employee written in English alphabet
    @IBOutlet weak var aliasEmployee: UILabel! /// The name of the employee written in Chinese characters
    @IBOutlet weak var numberEmployee: UILabel! /// The ID number of the employee
    
    /// Only three languages that will be supported: Traditional Chinese (zh-Hant), Simplified Chinese (zh-Hans), English
    lazy var textDetectionRequest: VNRecognizeTextRequest = {
        let request = VNRecognizeTextRequest(completionHandler: self.handleDetectedText)
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["zh-Hans", "zh-Hant", "en-US"]
        return request
    }()
    
    /**
     Select and upload photos from album
     - Parameters:
        - sender: Foxconn employee badge that has previously been captured and saved in Photo Album
     */
    @IBAction func selectPhotos(_ sender: Any) {
        presentPhotoPicker(type: .photoLibrary)
    }
  
    /**
     Capture photo using iPhone camera
     - Parameters:
        - sender: Foxconn emplpyee badge that has just been captured using camera
     */
    @IBAction func takePhotos(_ sender: Any) {
        presentPhotoPicker(type: .camera)
    }
    
    /**
     This functinon is responsible for handling and processing image of the employee badge, assuming the badge is held in vertical orientation
     */
    func processImage() {
        aliasEmployee.text = ""     // Chinese Name
        nameEmployee.text = ""      // English Name
        numberEmployee.text = ""    // Employee ID
        guard let image = image, let cgImage = image.cgImage else {
            return
        }

        let requests = [textDetectionRequest]
        let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage, orientation: .right, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try imageRequestHandler.perform(requests)
            } catch let error {
                print("Error: \(error)")
            }
        }
    }

    /**
     This function is responsible for handling text recognition using Core ML and Vision frameworks
     - Parameters:
        - request: Vision API that is dedicated to store and decipher texts in an input image
        - error: identify and inform users on what errors that cause the system to unable to handle the input image
     */
    fileprivate func handleDetectedText(request: VNRequest?, error: Error?) {
        if let error = error {
            presentAlert(title: "Error", message: error.localizedDescription)
            return
        }
        guard let results = request?.results, results.count > 0 else {
            presentAlert(title: "Error", message: "No text was found.")
            return
        }
    
        var components = [CardComponent]()
        
        for result in results {
            if let observation = result as? VNRecognizedTextObservation {
                for text in observation.topCandidates(1) {
                    let component = CardComponent()
                    component.x = observation.boundingBox.origin.x
                    component.y = observation.boundingBox.origin.y
                    component.text = text.string
                    components.append(component)
                }
            }
        }
        
        let totalPrediction:Int? = components.count // How many text predictions analyzed

        // To get access to employee ID, simply retrieve the last component of the list
        let numberComponent = components.last!
        
        DispatchQueue.main.async {
            // Assign employee's name, retrieve the second last component of the list
            self.nameEmployee.text = components[totalPrediction!-2].text
            
            // Assign employee's ID number, retrieve the very last component of the list
            self.numberEmployee.text = "\(numberComponent.text)"

            // Assign employee's Chinese name, retrieve the third last component of the list
            self.aliasEmployee.text = components[totalPrediction!-3].text
        }
    }
    
    /**
    Customized error handlers that will be used to inform users when text recognition or image upload is unsuccessful
     - Parameters:
        - title: Title of the message that will be conveyed to users
        - message: Further explanation to users on what causes the system to fail to work properly
     */
    fileprivate func presentAlert(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    
    /**
     Confirm users that employee ID picture has been loaded successfully from Photo Album
     - Parameters:
        - type: UIImagePickerController that represents the source where the image has been loaded
     */
    fileprivate func presentPhotoPicker(type: UIImagePickerController.SourceType) {
        let controller = UIImagePickerController()
        controller.sourceType = type
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
}

