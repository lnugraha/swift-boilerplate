//
//  MainPageView.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation
import UIKit

struct StoreFront {
    static let Cell = "StoreFrontCell"
}

class MainPageView: UINavigationController {

    private lazy var topBanner: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = bkColor
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        label.backgroundColor = bkColor
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "LISTS"
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
        return view
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.backgroundColor = bkColor
        button.setTitle("登出", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func logoutButtonTapped() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false, completion: nil)
    }

    let tb = UITableView(frame: UIScreen.main.bounds)
    var storeDataArray = [String]() // List of the store names
    var storeIdArray = [String]() // List of the store IDs that will be used to display book titles
    var bookDataArray = [Int]() // How many books are available in each store

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gyColor

        APIHandler.getCataloguePage(access_token: GlobalDataAccess.shared.access_token, completionHandler: {
            result in
            switch result {
            case .success(let catalogueModel):
                print("DEBUG SUCCESS: \(#function) \(#line)")

                let storeSize = catalogueModel.count
                for i in 0..<storeSize {
                    let checkStoreName = catalogueModel.data[i].name
                    let checkStoreId = catalogueModel.data[i].id
                    let checkStoreBookColletion = catalogueModel.data[i].products?.count ?? 0

                    self.bookDataArray.append(checkStoreBookColletion)
                    self.storeDataArray.append(checkStoreName)
                    self.storeIdArray.append(String(checkStoreId))
                }

                // Allocate a list as many as catalogueModel.count
                // Obtain id of a book: catalogueModel.data[0].products![0].id
            case .failure(let error):
                print("DEBUG ERROR: \(#function) \(#line)")
                print(error)
            }
        })

        self.view.addSubview(topBanner)
        topBanner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBanner.topAnchor.constraint(equalTo: self.view.topAnchor),
            topBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topBanner.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            topBanner.heightAnchor.constraint(equalToConstant: 110)
        ])

        topBanner.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            logoutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            logoutButton.widthAnchor.constraint(equalToConstant: 80),
            logoutButton.heightAnchor.constraint(equalToConstant: 30)
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
        self.tb.layoutMargins = UIEdgeInsets.zero
        self.tb.separatorInset = UIEdgeInsets.zero
        self.tb.showsVerticalScrollIndicator = false
        self.tb.register(StorefrontCell.self, forCellReuseIdentifier: StoreFront.Cell)
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

extension MainPageView: UITableViewDataSource, UITableViewDelegate {

    // MARK: Display the number of table cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeDataArray.count
    }

    // MARK: Customize each table cell using information from viewDidLoad
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreFront.Cell) as! StorefrontCell
        cell.setCellProperties(storeNames: storeDataArray[indexPath.row], bookTitles: bookDataArray[indexPath.row])
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }

    // MARK: Direct user from one table cell to a new view controller after clicking the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if bookDataArray[indexPath.row] > 0 {
            let storeCataloguewView = StoreCatalogueView()
            storeCataloguewView.titleBanner = storeDataArray[indexPath.row]
            storeCataloguewView.storeIdNumber = storeIdArray[indexPath.row]
            storeCataloguewView.modalPresentationStyle = .fullScreen
            present(storeCataloguewView, animated: false, completion: nil)
        } else {
            print("DEBUG: No books available at the designated store")
        }
    }

}
