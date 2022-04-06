//
//  ContentView.swift
//  PracticeProject
//
//  
//

import SwiftUI

struct ContentView: View {
    @StateObject var usersListViewModel = UsersListViewModel()
    
    var body: some View {
        if usersListViewModel.isLoading {
            DataLoadingView()
        }else if usersListViewModel.errorMessage != nil  {
            ErrorView(usersListViewModel: usersListViewModel)
        }else {
            UsersListView(usersListItems: usersListViewModel.usersList,
                          selectedUserId: "",
                          selectedUserName: "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
