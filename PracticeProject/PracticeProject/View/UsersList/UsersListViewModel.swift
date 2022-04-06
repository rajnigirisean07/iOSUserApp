//
//  UsersListViewModel.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation
import SwiftUI
import Combine

class UsersListViewModel: ObservableObject {
    
    @Published var usersList = UsersList()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    var selectedUserId = ""
    var selectedUserName = ""
    
    let service: APIManagerProtocol
    
    init(service: APIManagerProtocol = APIManager()) {
        self.service = service
        fetchAllUsersList()
    }
    
    func reloadUserslist() async {
        fetchAllUsersList()
    }
    
    func fetchAllUsersList() {
        isLoading = true
        errorMessage = nil
        let excludingUserWithID = 0
        //Fetch the user's list from the below mentioned URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        service.fetchUsersList(excludingUserWithID: excludingUserWithID ,url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):  //Failure Condition - Error Occured
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let usersList): //Success condition - User list fetched
                    print("Success fetching users list. Count - \(usersList.count)")
                    self.usersList = usersList.reversed() //Displaying user list in reverse order
                }
            }
        }
    }
    
    func fetchAllUsersList(excludingUserWithID: Int?) {
        isLoading = true
        errorMessage = nil
        
        //Fetch the user's list from the below mentioned URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        service.fetchUsersList(excludingUserWithID: excludingUserWithID ,url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):  //Failure Condition - Error Occured
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let usersList): //Success condition - User list fetched
                    print("Success fetching users list. Count - \(usersList.count)")
                    self.usersList = usersList
                        .filter(){$0.id != excludingUserWithID} //Removing the selected user from the user list
                        .reversed() //Displaying user list in reverse order
                    print("Count after filter - \(usersList.count)")
                }
            }
        }
    }
}
