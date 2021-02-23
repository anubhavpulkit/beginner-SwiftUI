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
    
    @State private var showAddView = false
    @ObservedObject var expense = Expenses()
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(expense.item){ item in
                    Text(item.name)
                }.onDelete(perform: removeItem)
            }
            .sheet(isPresented: $showAddView){
                        AddView(expenses: self.expense)
               }
            .navigationBarItems(trailing:
                Button(action: {
                    self.showAddView = true
                }) {
                    Image(systemName: "plus")
            })
            .navigationBarTitle("iExpense")
        }
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
