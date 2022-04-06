//
//  DataLoadingView.swift
//  PracticeProject
//
//  Created by Rajni Girisean on 4/2/22.
//

import SwiftUI

//Loading View - Fetching User list
struct DataLoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("⌛")
                .font(.system(size: 100))
            Text("Fetching User list... ")
                .foregroundColor(.orange)
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DataLoadingView()
    }
}
