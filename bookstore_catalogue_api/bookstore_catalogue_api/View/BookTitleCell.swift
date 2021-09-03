//
//  BookTitleCell.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/29.
//

import UIKit

class BookTitleCell: UITableViewCell {

    private lazy var proceedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = bkColor
        button.backgroundColor = gyColor
        return button
    }()

    private lazy var bookCover: UIImageView = {
        let figure = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        figure.backgroundColor = gyColor
        figure.layer.borderWidth = 2
        figure.layer.borderColor = bkColor.cgColor
        figure.tintColor = redColor
        return figure
    }()

    private lazy var bookTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.backgroundColor = gyColor
        label.textColor = bkColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    private lazy var bookAuthors: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.backgroundColor = gyColor
        label.textColor = bkColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = gyColor
        addSubview(proceedButton)
        addSubview(bookTitle)
        addSubview(bookAuthors)
        addSubview(bookCover)

        // Book Cover
        bookCover.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookCover.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookCover.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bookCover.widthAnchor.constraint(equalToConstant: 60),
            bookCover.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Book Title
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bookTitle.leadingAnchor.constraint(equalTo: bookCover.trailingAnchor, constant: 10),
            bookTitle.trailingAnchor.constraint(equalTo: proceedButton.leadingAnchor, constant: 0),
            bookTitle.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Book Authords
        bookAuthors.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookAuthors.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            bookAuthors.leadingAnchor.constraint(equalTo: bookCover.trailingAnchor, constant: 10),
            bookAuthors.trailingAnchor.constraint(equalTo: proceedButton.leadingAnchor, constant: 0),
            bookAuthors.heightAnchor.constraint(equalToConstant: 20)
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

    public func setCellProperties(titleStr: String, authorStr: String, coverStr: String) {
        bookTitle.text = titleStr
        bookAuthors.text = authorStr
        bookCover.load(urlStr: coverStr)
    }

}
