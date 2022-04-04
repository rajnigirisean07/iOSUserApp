//
//  UserslistFetchError.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import Foundation

// UserslistFetchError - Helps identify the nature of a particular failure
enum UserslistFetchError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // Feedback for the User
        switch self {
        case .badResponse(_):
            return "Sorry! Bad Response - Connection to the Server Failed."
        case .parsing,.badURL, .unknown:
            return "Sorry! Bad URL - Something went Wrong."
        case .url(let error):
            return error?.localizedDescription ?? "Sorry! Something went wrong with the request."
        }
    }
    
    var description: String {
        //Debugging Info
        switch self {
        case .badURL: return "Invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "URL Session Error"
        case .badResponse(statusCode: let statusCode):
            return "Bad Response with Status Code \(statusCode)"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .unknown: return "Unknown Error"
        }
    }
}
