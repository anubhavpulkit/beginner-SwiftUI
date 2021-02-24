//
//  ContentView.swift
//  iExpense
//
//  Created by Pully on 19/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

class Expenses: ObservableObject {
    
    @Published var items: [ExpenseItem] {
        
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }   }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items"){ //attempts to read whatever is in “Items” as a Data objec
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items){ //does the actual job of unarchiving the Data object into an array of ExpenseItem objects.
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
}

struct ContentView: View {
    
    @State private var showAddView = false
    @ObservedObject var expense = Expenses()
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(expense.items){ item in
                    
                    HStack{
                        Text(item.name)
                            .padding(.trailing)
                        Text(item.type)
                        Spacer()
                        Text("$\(item.amount)")
                    }
                    
                }.onDelete(perform: removeItem)
            }
            .sheet(isPresented: $showAddView){
                
                AddView(expenses: self.expense)
                
            }
            .navigationBarItems(trailing:
                
                Button(action: {
                    self.showAddView = true  })
                {
                    Image(systemName: "plus") })
                .navigationBarTitle("iExpense")
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expense.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
