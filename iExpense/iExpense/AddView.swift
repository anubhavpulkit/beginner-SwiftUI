//
//  AddView.swift
//  iExpense
//
//  Created by Pully on 23/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @Environment (\.presentationMode) var presentationMode
    
    static let types = ["Personal", "Bussiness"]
    
    @ObservedObject var expenses: Expenses // using same instace of class which is present in Content view
    
    var body: some View {
        
        NavigationView{
           
            Form{
                
                TextField("Name the expense", text: $name)
                    .padding(30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Picker("" ,selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                    .padding(30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Home Page"){
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle("Add new expense")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
