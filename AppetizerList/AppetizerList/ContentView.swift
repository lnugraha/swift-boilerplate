//
//  ContentView.swift
//  AppetizerList
//
//  Created by Leo Nugraha on 2022/6/23.
//

import SwiftUI

struct User: Codable, Identifiable {
    var id: Int
    var name: String
}

struct UserView: View {
    
    @StateObject var viewModel = ViewModel()
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { userz in
            Text(userz.name)
        }
        .onAppear(perform: viewModel.getUsers)
    }
}

extension UserView {
    
    class ViewModel: ObservableObject {
        @Published var users = [User]()

        // let dataService = AppDataService()
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }

        public func getUsers() {
            dataService.getUsers { [weak self] users in
                self?.users = users
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0, name: "Dummy Model")
        let viewModel = UserView.ViewModel()
        viewModel.users = [user]
        return UserView(viewModel: viewModel)
    }
}
