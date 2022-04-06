//
//  UsersListItem.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation

// Users List - Created a data type representing users-list (based on JSON response:https://jsonplaceholder.typicode.com/users)
// Only the required content is used - id, name, email, city and company name

// UsersListItem
struct UsersListItem: Identifiable, Codable {
    let id: Int
    let name, email: String
    let address: Address
    let company: Company
    
    init(id: Int, name: String, email: String, address: String,
         company: String){
        self.id = id
        self.name = name
        self.email = email
        self.address = Address.init(city: address)
        self.company = Company.init(name: company)
    }
    
    //Used in Unit Testcase
    static func samplePlaceholderUserList() -> UsersListItem {
        return UsersListItem(
                     id: 111,
                     name: "Test User",
                     email: "test@user.com",
                     address: "local",
                     company: "Test Company")
    }
}

// UsersListItem - Address
struct Address: Codable {
    let city: String
}

// UsersListItem - Company
struct Company: Codable {
    let name: String
}

typealias UsersList = [UsersListItem]
