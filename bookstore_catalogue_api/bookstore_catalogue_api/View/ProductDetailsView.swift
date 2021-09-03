//
//  ProductDetailsView.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation
import UIKit

// The last page of the app
class ProductDetailsView: UINavigationController {

    var titleBanner = String(); var storeIdNumber = String()
    var bookTitle: String = ""
    var bookIdNumber = String(); var coverPage: String = ""

    func getTopBanner(titleName: String) -> UIView {
        let topbanner = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 110))
        topbanner.backgroundColor = bkColor
        // Main title in the middle
        let title = UILabel(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 30))
        title.text = titleName
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.backgroundColor = bkColor
        title.textColor = UIColor.white
        title.textAlignment = .center
        // Back button on the left
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        // Add button on the right
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = UIColor.white

        topbanner.addSubview(title)
        topbanner.addSubview(backButton)
        topbanner.addSubview(addButton)

        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topbanner.topAnchor, constant: 50),
            title.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: 0),
            title.heightAnchor.constraint(equalToConstant: 50)
        ])

        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topbanner.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: topbanner.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topbanner.topAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: topbanner.trailingAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        return topbanner
    }

    @objc func backButtonTapped() {
        let storeCatalogueView = StoreCatalogueView()
        storeCatalogueView.storeIdNumber = self.storeIdNumber
        storeCatalogueView.titleBanner = self.titleBanner
        storeCatalogueView.modalPresentationStyle = .fullScreen
        present(storeCatalogueView, animated: false, completion: nil)
    }

    private lazy var coverIllustration: UIImageView = {
        let cover = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        cover.backgroundColor = gyColor
        cover.layer.borderWidth = 2
        cover.layer.borderColor = bkColor.cgColor
        return cover
    }()

    func getBackgroundScrollView(text: String) -> UIScrollView {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1000))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        view.backgroundColor = .yellow

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1000))
        label.textColor = bkColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = gyColor

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            label.heightAnchor.constraint(equalToConstant: 1000)
        ])

        return view
    }

    private lazy var bookDescription: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: UIScreen.main.bounds.height))
        label.backgroundColor = gyColor
        label.textColor = bkColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gyColor
        let topBanner = getTopBanner(titleName: self.bookTitle)
        self.view.addSubview(topBanner)
        self.view.addSubview(coverIllustration)

        let backgroundScrollView = UIScrollView()
        backgroundScrollView.backgroundColor = gyColor

        let backgroundView = UIView()
        backgroundView.backgroundColor = gyColor
        self.view.addSubview(backgroundScrollView)
        backgroundScrollView.addSubview(backgroundView)

        var textSummary: String?
        APIHandler.getProductDescription(access_token: GlobalDataAccess.shared.access_token, bookId: self.bookIdNumber, completionHandler: {
            result in
            switch result {
            case .success(let descriptionModel):
                print("DEBUG SUCCESS: \(#function) \(#line)")
                textSummary = descriptionModel.data.description!
            case .failure(let error):
                print("DEBUG ERROR: \(#function) \(#line)")
                print(error)
            }
        })

        loadDescription(imgUrl: self.coverPage, textDesc: textSummary ?? "No description available")

        coverIllustration.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coverIllustration.topAnchor.constraint(equalTo: topBanner.bottomAnchor, constant: 20),
            coverIllustration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            coverIllustration.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            coverIllustration.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75)
        ])

        backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundScrollView.topAnchor.constraint(equalTo: coverIllustration.bottomAnchor, constant: 10),
            backgroundScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backgroundScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0),
            backgroundScrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: UIScreen.main.bounds.width),
            backgroundScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
        ])

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: backgroundScrollView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: backgroundScrollView.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: backgroundScrollView.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: backgroundScrollView.bottomAnchor),
            backgroundView.widthAnchor.constraint(equalTo: backgroundScrollView.widthAnchor)
        ])

        backgroundView.addSubview(bookDescription)
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookDescription.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            bookDescription.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            bookDescription.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bookDescription.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            bookDescription.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
            bookDescription.heightAnchor.constraint(equalTo: backgroundView.heightAnchor),
        ])

    }

    private func loadDescription(imgUrl: String, textDesc: String) {
        coverIllustration.load(urlStr: imgUrl)
        bookDescription.text = textDesc
    }

}
