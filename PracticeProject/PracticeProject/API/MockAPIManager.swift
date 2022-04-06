//
//  MockAPIManager.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 4/3/22.
//

import Foundation
struct MockAPIManager: APIManagerProtocol {
    var result: Result<UsersList, UserslistFetchError>
    
    func fetchUsersList(excludingUserWithID: Int?, url: URL?, completion: @escaping (Result<UsersList, UserslistFetchError>) -> Void) {
        completion(result)
    }
}
