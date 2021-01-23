//
//  ContentView.swift
//  splitter
//
//  Created by Pully on 21/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var tipPercentage = 1
    @State private var numberOfPeople = 2
    var tipPercentages = ["5","10","15","20"]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter amount to pay:", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Text("Cost to pay is: \(checkAmount)")
                }
                Section(header: Text("Select % Tip")){
                    Picker("Percent of Tip", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text(self.tipPercentages[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    VStack{
                        Picker("Number of people:", selection: $numberOfPeople){
                            ForEach(0..<10){
                                Text("\($0) people")
                            }
                        }
//                        Text("Number of pople is : \(numberOfPeople)")
                    }
                }
                
                let tipPay = Int(checkAmount) ?? 0
                
                let total = (tipPay + tipPercentage) / numberOfPeople
                
                Section{
                    Text("1 Person pay:  \(total)")
                }
            }
            .navigationTitle("Splitter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
