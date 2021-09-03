//
//  StorefrontCell.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/28.
//

import UIKit

// MARK: This cell will be used to display all stores in MainPageView
class StorefrontCell: UITableViewCell {

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = bkColor
        button.backgroundColor = gyColor
        return button
    }()

    private lazy var storeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.backgroundColor = gyColor
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = bkColor
        return label
    }()

    private lazy var bookLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.backgroundColor = gyColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = bkColor
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = gyColor
        addSubview(storeLabel)
        addSubview(bookLabel)
        addSubview(proceedButton)
        // Store Name Label
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            storeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            storeLabel.trailingAnchor.constraint(equalTo: bookLabel.leadingAnchor),
            storeLabel.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Books Title Available Label
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookLabel.trailingAnchor.constraint(equalTo: proceedButton.leadingAnchor),
            bookLabel.widthAnchor.constraint(equalToConstant: 60),
            bookLabel.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Proceed Button
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proceedButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            proceedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            proceedButton.widthAnchor.constraint(equalToConstant: 40),
            proceedButton.heightAnchor.constraint(equalToConstant: 60)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setCellProperties(storeNames: String, bookTitles: Int) {
        // print("Book Store: \(storeNames) has a collection of \(String(bookTitles)) books")
        storeLabel.text = storeNames
        bookLabel.text = String(bookTitles) + " books"
    }

}
