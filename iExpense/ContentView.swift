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
                if expesnes.personalExpenses.count > 0 {
                    Section("Personal") {
                        ForEach(expesnes.personalExpenses) { item in
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(expesnes.colorForExpense(amount: item.amount))
                            }
                        }
                        .onDelete(perform: removePersonalExpense(at:))
                    }
                }
                if expesnes.businessExpenses.count > 0 {
                    Section("Business") {
                        ForEach(expesnes.businessExpenses) { item in
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(expesnes.colorForExpense(amount: item.amount))
                            }
                        }
                        .onDelete(perform: removeBusinessExpense(at:))
                    }
                }
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
    
    func removePersonalExpense(at offSets: IndexSet) {
        expesnes.personalExpenses.remove(atOffsets: offSets)
    }
    
    func removeBusinessExpense(at offSets: IndexSet) {
        expesnes.businessExpenses.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
