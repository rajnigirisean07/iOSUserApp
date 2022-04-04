//
//  APIManagerProtocol.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation

protocol APIManagerProtocol {
    func fetchUsersList(excludingUserWithID: Int?, url: URL?, completion: @escaping(Result<UsersList, UserslistFetchError>) -> Void)
}
