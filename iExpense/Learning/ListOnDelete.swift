//
//  ListOnDelete.swift
//  iExpense
//
//  Created by Takasur Azeem on 02/03/2022.
//

import SwiftUI

struct ListOnDelete: View {
    
    @State private var numbers: [Int] = []
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                    
                    Button("Add Number") {
                        withAnimation {
                            numbers.append(currentNumber)
                        }
                        currentNumber += 1
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offSets: IndexSet) {
        numbers.remove(atOffsets: offSets)
    }
}

struct ListOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        ListOnDelete()
    }
}
