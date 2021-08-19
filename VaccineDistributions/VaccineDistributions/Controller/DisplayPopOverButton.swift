//
//  DisplayPopOverButton.swift
//  VaccineDistributions
//
//  Created by Leo Nugraha on 2021/8/12.
//

import Foundation
import UIKit

// MARK: The popover menu offers four distinct buttons that lead users to a specific option
class PopOverMenuController: UIView {

    fileprivate let profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Component 188 – 2"), for: .normal)
        button.setTitle("個人資訊", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 24.0, left: 24.0, bottom: 24.0, right: 24.0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        button.topAnchor.constraint(equalTo: button.topAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.widthAnchor.constraint(equalToConstant: 184).isActive = true

        return button
    }()

    @objc private func profileButtonTapped() {
        
    }

    fileprivate let passwordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Component 189 – 2"), for: .normal)
        button.setTitle("修改密碼", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 24.0, left: 24.0, bottom: 24.0, right: 24.0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)

        button.topAnchor.constraint(equalTo: button.topAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.widthAnchor.constraint(equalToConstant: 184).isActive = true

        return button
    }()

    @objc private func passwordButtonTapped() {
        
    }

    fileprivate let cardReaderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Component 191 – 2"), for: .normal)
        button.setTitle("硬體資訊", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 24.0, left: 24.0, bottom: 24.0, right: 24.0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(cardReaderButtonTapped), for: .touchUpInside)

        button.topAnchor.constraint(equalTo: button.topAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.widthAnchor.constraint(equalToConstant: 184).isActive = true

        return button
    }()
    
    @objc private func cardReaderButtonTapped() {
        let cardReaderView = CardReaderView()
        cardReaderView.modalPresentationStyle = .fullScreen
        // How to redirect from UIView to UIViewController

        
    }
    
    fileprivate let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Component 190 – 3"), for: .normal)
        button.setTitle("登出", for: .normal)
        button.setTitleColor(bkColor, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 24.0, left: 24.0, bottom: 24.0, right: 24.0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        button.topAnchor.constraint(equalTo: button.topAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.widthAnchor.constraint(equalToConstant: 184).isActive = true
        
        return button
    }()
    
    @objc private func logoutButtonTapped() {
        let logoutView = LogoutPageView()
        logoutView.modalPresentationStyle = .fullScreen
        // How to redirect from UIView to UIViewController
    }

    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:[profileButton, passwordButton, cardReaderButton, logoutButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    fileprivate lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))

        self.frame = UIScreen.main.bounds
        self.addSubview(container)

        container.addSubview(profileButton)
        container.addSubview(passwordButton)
        container.addSubview(cardReaderButton)
        container.addSubview(logoutButton)

        // MARK: This section determines where the popover menu will be placed
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 96),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            container.widthAnchor.constraint(equalToConstant: 184),
            container.heightAnchor.constraint(equalToConstant: 320)
        ])

        // MARK: Stack handles the contents inside the popup menu
        container.addSubview(stack)
        stack.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Animation effects
    @objc fileprivate func animateOut() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 1

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 0
        })

    }

    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })

    }
    
}
