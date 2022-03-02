//
//  ShowHideViews_Screens.swift
//  iExpense
//
//  Created by Takasur Azeem on 01/03/2022.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Takasur"
    @Published var lastName = "Azeem"
}

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowHideViews_Screens: View {
    @StateObject var user = User()
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Takasur Azeemllll,,mk/..,,,lk ccnmklklkl;l;l;m,.")
        }
    }
}


struct ShowHideViews_Screens_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideViews_Screens()
    }
}
