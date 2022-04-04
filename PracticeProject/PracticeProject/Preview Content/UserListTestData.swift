//
//  UsersListTestData.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation

struct UserListTestData {
    static var userListItem: UsersList = {
        let url = Bundle.main.url(forResource: "UserListItem", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode(UsersList.self, from: data)
    }()
}
