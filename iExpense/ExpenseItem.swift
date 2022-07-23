//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Takasur Azeem on 05/03/2022.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

extension ExpenseItem {
    var color: Color {
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
