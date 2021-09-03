//
//  StoreCatalogueView.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation
import UIKit

struct BookTitle{
    static let Cell = "BookTitleCell"
}

class StoreCatalogueView: UIViewController {

    var titleBanner = String(); var storeIdNumber = String()

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
        let mainPageView = MainPageView()
        mainPageView.modalPresentationStyle = .fullScreen
        present(mainPageView, animated: false, completion: nil)
    }

    let tb = UITableView(frame: UIScreen.main.bounds)
    var imgUrlArray     = [String]()
    var bookTitleArray  = [String]()
    var authorsArray    = [String]()
    var bookIdArray     = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gyColor
        print("DEBUG: Store ID Number \(storeIdNumber)")

        APIHandler.getBookListSingleStore(access_token: GlobalDataAccess.shared.access_token, storeId: storeIdNumber, completionHandler: {
            result in
            switch result{
            case .success(let SingleCatalogueModel):
                // print(SingleCatalogueModel)
                // Data To Be Retrieved
                // Cover Image URL, Title, Authors

                let catalogueSize: Int = SingleCatalogueModel.data.products!.count
                for i in 0..<catalogueSize {
                    let checkImgUrl = SingleCatalogueModel.data.products![i].imageUrl
                    if checkImgUrl == nil {
                        let blank = ""
                        self.imgUrlArray.append(blank)
                    } else {
                        self.imgUrlArray.append(checkImgUrl!)
                    }

                    let checkBookTitle = SingleCatalogueModel.data.products![i].name
                    print(checkBookTitle)
                    self.bookTitleArray.append(checkBookTitle)

                    let numOfAuthors = SingleCatalogueModel.data.products![i].authors?.count
                    if numOfAuthors == 1 {
                        let checkAuthorName = SingleCatalogueModel.data.products![i].authors![0]
                        self.authorsArray.append(checkAuthorName)
                    } else if numOfAuthors == nil {
                        let checkAuthorName = "Not Available"
                        self.authorsArray.append(checkAuthorName)
                    } else if numOfAuthors! > 1 {
                        var checkAuthorName = ""
                        let totalAuthors = SingleCatalogueModel.data.products![i].authors?.count
                        for j in 0..<totalAuthors! {
                            if j == (totalAuthors!-1) {
                                checkAuthorName += SingleCatalogueModel.data.products![i].authors![j]
                            } else {
                                checkAuthorName += SingleCatalogueModel.data.products![i].authors![j] + ", "
                            }
                        }
                        self.authorsArray.append(checkAuthorName)
                    }

                    let checkBookId = SingleCatalogueModel.data.products![i].id
                    print(checkBookId)
                    self.bookIdArray.append(String(checkBookId))
                }

            case .failure(let error):
                print("DEBUG ERROR: \(#function) \(#line) \(error)")
            }
        })

        let topBanner = getTopBanner(titleName: self.titleBanner)
        self.view.addSubview(topBanner)
        topBanner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBanner.topAnchor.constraint(equalTo: self.view.topAnchor),
            topBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topBanner.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            topBanner.heightAnchor.constraint(equalToConstant: 110)
        ])

        let backgroundScrollView = UIScrollView()
        backgroundScrollView.backgroundColor = gyColor

        let backgroundView = UIView()
        backgroundView.backgroundColor = gyColor
        self.view.addSubview(backgroundScrollView)
        backgroundScrollView.addSubview(backgroundView)

        backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundScrollView.topAnchor.constraint(equalTo: topBanner.bottomAnchor, constant: 0),
            backgroundScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backgroundScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0),
            backgroundScrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: UIScreen.main.bounds.width),
            backgroundScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: backgroundScrollView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: backgroundScrollView.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: backgroundScrollView.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: backgroundScrollView.bottomAnchor),
            backgroundView.widthAnchor.constraint(equalTo: backgroundScrollView.widthAnchor)
        ])

        backgroundView.addSubview(tb)
        self.tb.rowHeight = 80
        self.tb.separatorStyle = .none
        self.tb.showsVerticalScrollIndicator = false
        self.tb.register(BookTitleCell.self, forCellReuseIdentifier: BookTitle.Cell)
        self.tb.delegate = self
        self.tb.dataSource = self

        NSLayoutConstraint.activate([
            tb.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
            tb.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            tb.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tb.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            tb.heightAnchor.constraint(equalTo: backgroundView.heightAnchor)
        ])

    }

}

extension StoreCatalogueView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookTitleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTitle.Cell) as! BookTitleCell
        cell.setCellProperties(titleStr: self.bookTitleArray[indexPath.row], authorStr: self.authorsArray[indexPath.row], coverStr: self.imgUrlArray[indexPath.row])
        return cell
    }

    // MARK: Direct user from one table cell to a new view controller after clicking the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetaisView = ProductDetailsView()
        productDetaisView.storeIdNumber = self.storeIdNumber
        productDetaisView.titleBanner = self.titleBanner
        productDetaisView.bookIdNumber = self.bookIdArray[indexPath.row]
        productDetaisView.coverPage = self.imgUrlArray[indexPath.row]
        productDetaisView.bookTitle = self.bookTitleArray[indexPath.row]
        productDetaisView.modalPresentationStyle = .fullScreen
        present(productDetaisView, animated: false, completion: nil)
    }

}
