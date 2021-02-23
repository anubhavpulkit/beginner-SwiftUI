//
//  ContentView.swift
//  iExpense
//
//  Created by Pully on 19/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var item = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expense = Expenses()
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(expense.item){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    
                    let expense = ExpenseItem(name: "TESR", type: "Personal", amount: 34)
                    self.expense.item.append(expense)
                    
                }) {
                    Image(systemName: "plus")
            })
            
        }.navigationBarTitle("iExpense")
    }
    
    func removeItem(at offsets: IndexSet) {
        expense.item.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
