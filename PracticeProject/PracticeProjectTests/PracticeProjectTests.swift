//
//  PracticeProjectTests.swift
//  PracticeProjectTests
//
//  Created by Rajni Girisean on 3/30/22.
//

import XCTest
import Combine
@testable import PracticeProject

class PracticeProjectTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_fetching_usersList_success() {
        let result = Result<[UsersListItem], UserslistFetchError>.success([UsersListItem.samplePlaceholderUserList()])
        let fetcher = UsersListViewModel(service: MockAPIManager(result: result))
        
        let promise = expectation(description: "Fetching User List...")
        
        fetcher.$usersList
            .sink { usersList in
                if usersList.count > 0 {
                    promise.fulfill()
                }
            }.store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
        let result = Result<UsersList, UserslistFetchError>.failure(UserslistFetchError.badURL)
        let fetcher = UsersListViewModel(service: MockAPIManager(result: result))
        
        let promise = expectation(description: "Error message shown.")
        fetcher.$usersList
            .sink { usersList in
                if !usersList.isEmpty {
                    XCTFail()
                }
            }.store(in: &subscriptions)
        
        fetcher.$errorMessage
            .sink { message in
                if message != nil {
                    promise.fulfill()
                }
            }.store(in: &subscriptions)
        wait(for: [promise], timeout: 2)
    }
    
    //JSON Decoder - 'UserListItemTestSample.json'
    func testUserListItemTestSampleDecoding() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "UserListItemTestSample", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
                  return
              }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let userListItem = try? decoder.decode(UsersListItem.self, from: data) else {
            return
        }
        
        //Verify if UsersList has value in it
        XCTAssertNotNil(userListItem)
        
        //Verify if User data mentioned inside 'UserListItemTestSample.json' is correctly decoded
        XCTAssertEqual(userListItem.id, 101)
        XCTAssertEqual(userListItem.name, "Lilly Bell")
        XCTAssertEqual(userListItem.email, "lilly.bell@april.biz")
        XCTAssertEqual(userListItem.address.city, "London")
        XCTAssertEqual(userListItem.company.name, "Apple Inc.")
        
    }
}
