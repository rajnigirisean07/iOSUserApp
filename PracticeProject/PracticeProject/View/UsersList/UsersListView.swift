//
//  UsersListView.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 3/30/22.
//

import SwiftUI

struct UsersListView: View {
    let usersListItems: UsersList
    @StateObject var usersListViewModel = UsersListViewModel()
    @State var selectedUserId: String! = nil
    @State var selectedUserName: String! = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0){
                Spacer()
                Text("👤   Selected User ")
                    .font(.title)
                Group {
                    VStack(alignment: .leading, spacing: 2.0){
                        HStack(spacing: 10.0) {
                            Text("Name: ")
                            Text(selectedUserName)
                        }
                        HStack(spacing: 10.0) {
                            Text("id: ")
                            Text(selectedUserId)
                        }
                    }
                }
                .font(.headline)
                .padding(20.0)
                .border(Color.black)
                
                List{
                    ForEach(usersListViewModel.usersList){ userListItem in
                        Row(id: userListItem.id,
                            name: userListItem.name,
                            email: userListItem.email,
                            city: userListItem.address.city,
                            companyName:userListItem.company.name
                        )
                            .padding()
                            .onTapGesture {
                                print("Row Selected: " +  userListItem.name)
                                selectedUserId = String(userListItem.id)
                                selectedUserName = userListItem.name
                                usersListViewModel.fetchAllUsersList(excludingUserWithID: userListItem.id)
                            }
                    }
                }
            }
            .navigationTitle("User List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct Row: View {
    let id: Int
    let name: String
    let email: String
    let city: String
    let companyName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Group {
                HStack(spacing: 10.0) {
                    Text("id: ")
                    Text(String(id))
                }
                HStack(spacing: 10.0) {
                    Text("Name: ")
                    Text(name)
                }
            }
            .font(.headline)
            
            Group {
                HStack(spacing: 10.0) {
                    Text("Email id: ")
                    Text(email)
                }
                HStack(spacing: 10.0) {
                    Text("City: ")
                    Text(city)
                }
                HStack(spacing: 10.0) {
                    Text("Company Name: ")
                    Text(companyName)
                }
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding(.vertical, 5.0)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UsersListView(usersListItems: UserListTestData.userListItem)
        }
    }
}
