//
//  ErrorView.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 4/2/22.
//

import SwiftUI

//Error View - Display Error
struct ErrorView: View {
    @ObservedObject var usersListViewModel: UsersListViewModel
    var body: some View {
        VStack {
            Text("⚠️")
                .font(.system(size: 100))
            Text(usersListViewModel.errorMessage ?? "")
            Text("Error Occured !!!")
                .foregroundColor(.red)
            Button {
                usersListViewModel.fetchAllUsersList()
            } label: {
                HStack {
                    Text("🔄")
                    Text("Retry")
                        .foregroundColor(.blue)
                        .underline()
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(usersListViewModel: UsersListViewModel())
    }
}
