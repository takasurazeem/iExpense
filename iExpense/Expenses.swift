//
//  Expenses.swift
//  iExpense
//
//  Created by Takasur Azeem on 05/03/2022.
//

import SwiftUI

class Expenses: ObservableObject {
    
    @Published var items: [ExpenseItem] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
            }
        }
    }
    
    func colorForExpense(amount: Double) -> Color {
        switch amount {
        case 0.0..<10.0:
            return .green
        case 10.0..<100.0:
            return .orange
        default:
            return .red
        }
    }
    
}
