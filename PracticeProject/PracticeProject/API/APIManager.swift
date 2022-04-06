//
//  APIManager.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation
import SwiftUI

struct APIManager: APIManagerProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,UserslistFetchError>) -> Void) {
        guard let url = url else {
            let error = UserslistFetchError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(UserslistFetchError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(UserslistFetchError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                }catch {
                    completion(Result.failure(UserslistFetchError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
    
    func fetchUsersList(excludingUserWithID: Int?, url: URL?, completion: @escaping(Result<UsersList, UserslistFetchError>) -> Void){
        guard let url = url else {
            let error = UserslistFetchError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(UserslistFetchError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(UserslistFetchError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let userslist = try decoder.decode(UsersList.self, from: data)
                    completion(Result.success(userslist))
                }catch {
                    completion(Result.failure(UserslistFetchError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
