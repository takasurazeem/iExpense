//
//  ContentView.swift
//  iExpense
//
//  Created by Takasur Azeem on 03/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expesnes = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expesnes.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expesnes.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func removeItems(at offSets: IndexSet) {
        expesnes.items.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
