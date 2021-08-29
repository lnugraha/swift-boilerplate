//
//  ViewController.swift
//  weather_forecast_twn
//
//  Created by Leo Nugraha on 2021/8/26.
//

import UIKit

class ViewController: UIViewController {

    private lazy var backgroundView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = UIColor.gray

        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 256, height: 512))
        image.image = UIImage(named: "taipei_map")
        image.contentMode = .scaleAspectFill
        
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//            image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
//            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
//        ])

        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
        return view
    }()
    
    private lazy var cardTopLeft: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var cardTopRight: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .red
        return view
    }()

    private lazy var cardBottomLeft: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var cardBottomRight: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIHandlerController.getDataFromApi()
        
        let safeArea = view.safeAreaLayoutGuide

        self.view.addSubview(cardTopLeft)
        cardTopLeft.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTopLeft.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardTopLeft.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cardTopLeft.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            cardTopLeft.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5)
        ])

        self.view.addSubview(cardTopRight)
        cardTopRight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTopRight.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardTopRight.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cardTopRight.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            cardTopRight.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5)
        ])

        self.view.addSubview(cardBottomLeft)
        cardBottomLeft.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardBottomLeft.topAnchor.constraint(equalTo: cardTopLeft.bottomAnchor),
            cardBottomLeft.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cardBottomLeft.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            cardBottomLeft.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5)
        ])

        self.view.addSubview(cardBottomRight)
        cardBottomRight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardBottomRight.topAnchor.constraint(equalTo: cardTopRight.bottomAnchor),
            cardBottomRight.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cardBottomRight.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            cardBottomRight.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5)
        ])

        
        
    }

}

