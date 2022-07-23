//
//  ExpenseView.swift
//  iExpense
//
//  Created by Takasur Azeem on 23/07/2022.
//

import SwiftUI

struct ExpenseView: View {
    
    @State private var item: ExpenseItem
    
    init(expense item: ExpenseItem) {
        _item = State(wrappedValue: item)
    }
    
    
    var body: some View {
        HStack {
            Text(item.name)
                .font(.headline)
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(item.color)
        }
        .accessibilityElement()
        .accessibilityValue("\(item.name) \(localizedAmountForVoiceOver)")
        .accessibilityHint(item.type)
    }
    
    
    var localizedAmountForVoiceOver: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currencyPlural
        let locale = Locale(identifier: Locale.current.identifier)
        numberFormatter.locale = locale
        
        let number = numberFormatter.string(from: NSNumber(value: item.amount))
        return number ?? ""
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(expense: ExpenseItem(name: "Dinner", type: "Personal", amount: 200))
    }
}
