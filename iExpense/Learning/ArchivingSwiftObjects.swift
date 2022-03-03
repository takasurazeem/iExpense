//
//  ArchivingSwiftObjects.swift
//  iExpense
//
//  Created by Takasur Azeem on 03/03/2022.
//

import SwiftUI

struct ArchivingSwiftObjects: View {
    
    struct User: Codable {
        let firstName: String
        let lastName: String
    }
    
    @State private var user = User(firstName: "Takasur", lastName: "Azeem")
    
    var body: some View {
        Button {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        } label: {
            Text("Save User")
        }
    }
}

struct ArchivingSwiftObjects_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingSwiftObjects()
    }
}
