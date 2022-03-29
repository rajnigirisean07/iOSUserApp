//
//  API.swift
//  API
//

import Foundation

protocol API {
    init()

    func fetchUsers(excludingUserWithID: String?, success: (UsersList) -> Void, failure: (FetchError) -> Void)
}

extension API {
//    static func make() -> API {
//        // TODO: Return the concrete implementation of API
//    }
}

// TODO: Create a data type representing users-list (according to expected JSON response)
// (See the JSON response at: https://jsonplaceholder.typicode.com/users)
//
typealias UsersList = Any

// TODO (Bonus): Create a more specific error type.
// This can help identify the nature of a particular failure case.
// e.g. network timeout, badly formatted request or failing to decode/deserialize
// a response could cause failure in a network request.
//
typealias FetchError = Any
