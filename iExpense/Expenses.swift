//
//  Expenses.swift
//  iExpense
//
//  Created by Takasur Azeem on 05/03/2022.
//

import Foundation

class Expenses: ObservableObject {
    
    @Published var items: [ExpenseItem] = []
    
}
