//
//  DataService.swift
//  AppetizerList
//
//  Created by Leo Nugraha on 2022/6/23.
//

import Foundation
import SwiftUI
import UIKit

protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
    func getUsers(completion: @escaping ([User])->Void) {
        DispatchQueue.main.async {
            completion([
                User(id: 1, name: "A"),
                User(id: 2, name: "B"),
                User(id: 3, name: "C")
            ])
        }
    }
}
