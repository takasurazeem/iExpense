//
//  Expenses.swift
//  iExpense
//
//  Created by Takasur Azeem on 05/03/2022.
//

import SwiftUI

class Expenses: ObservableObject {
    
    @Published var personalExpenses: [ExpenseItem] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalExpenses) {
                UserDefaults.standard.set(encoded, forKey: "Personal")
            }
        }
    }
    
    @Published var businessExpenses: [ExpenseItem] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessExpenses) {
                UserDefaults.standard.set(encoded, forKey: "Business")
            }
        }
    }
    
    init() {
        if let savedPersonalExpenses = UserDefaults.standard.data(forKey: "Personal") {
            if let decodedPersonalExpenses = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalExpenses) {
                personalExpenses = decodedPersonalExpenses
            }
            if let savedBusinessExpenses = UserDefaults.standard.data(forKey: "Business") {
                if let decodedBusinessExpenses = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessExpenses) {
                    businessExpenses = decodedBusinessExpenses
                }
            }
        }
    }

    
}
