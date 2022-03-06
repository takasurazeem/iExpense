//
//  ContentView.swift
//  iExpense
//
//  Created by Takasur Azeem on 03/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expesnes = Expenses()
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expesnes.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .foregroundColor(expesnes.colorForExpense(amount: item.amount))
                    }
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showingAddExpenses) {
            AddExpenseView(expenses: expesnes)
        }
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
