//
//  DataModel.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation

final public class GlobalDataAccess {
    static let shared = GlobalDataAccess()
    var access_token: String!
}

struct LoginModel: Codable {
    var access_token: String
    var token_type: String
    var refresh_token: String
    var expires_in: Int
    var scope: String
}

// MARK: Obtained after parsing the access_code to the checklist APIs
struct ChecklistModel: Codable {
    var id: Int
    var name: String
    var shared: Bool
    var created: String
    var lastModified: String
    var shopper: ShopperModel
    var products: [ProductsModel]?
    var `class`: String
    var statistics: StatisticsModel
    var imageUrl: String?
}

struct ShopperModel: Codable {
    var id: Int
    var nickname: String
}

struct StatisticsModel: Codable {
    var viewed: Int
    var followed: Int
}

struct ProductsModel: Codable {
    var id: Int
    var name: String
    var ean: Int
    var imageUrl: String?
    var stores: [StoreModel]?
    var isbn10: String
    var isbn13: String
    var authors: [String]?
    var numPages: Int?
    var rating: BookRatingModel
}

struct StoreModel: Codable {
    var id: Int
    var name: String
    var phone: String
    var owner: Dictionary<String, Int>?
    var imageUrl: String
    var inStock: Int
    var price: Double?
    var currency: String
    var location: LocationModel?
}

struct LocationModel: Codable {
    var id: Int
    var addressCity: String
    var addressCountry: String
    var addressLine1: String
    var addressState: String
    var addressZip: String
}

struct BookRatingModel: Codable {
    var statistics: BookStatisticsModel?
    var user: String?
}

struct  BookStatisticsModel: Codable {
    var average: Int?
    var count: Int?
    var distribution: Dictionary<String, String>?
}

// MARK: This section is the initial struct that will be parsed when successfully logging in
struct CatalogueModel: Codable {
    var count: Int
    var data: [ChecklistModel]
    var max: Int
    var message: String
    var processing: Int
    var status: Int
    var success: Bool
    var total: Int
}

struct SingleStoreCatalogueModel: Codable {
    var count: Int
    var data: ChecklistModel
    var max: Int
    var message: String
    var processing: Int
    var status: Int
    var success: Bool
    var total: Int
}

// Catalogue -> Checklist

// MARK: This section display details about a specific book, given the information of their book ID
struct DescriptionModel: Codable {
    var count: Int
    var data: BookDescriptionModel
    var max: Int
    var message: String
    var processing: Int
    var status: Int
    var success: Bool
    var total: Int
}

struct BookDescriptionModel: Codable {
    var id: Int
    var ean: Int
    var url: String
    var name: String
    var format: String
    var description: String? // Required for the last page display
    var activities: Dictionary<String, Int>?
    var reservable: Bool
    var stores: [StoreModel]?
    var isbn10: String
    var isbn13: String
    var publisher: String?
    var published: String?
    var rating: BookRatingModel
}
