//
//  ContentView.swift
//  ConverterAppi
//
//  Created by Pully on 24/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 1
    @State private var output = 1
    @State private var amount = ""
    
    
    var inputType = ["Celsius","Fahrenheit","kelvin"]
    var outType = ["Celsius","Fahrenheit","kelvin"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text( "Select Input type:")){
                    Picker("Select input type", selection: $input){
                        ForEach(0..<inputType.count){
                            Text("\(self.inputType[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    //Text("selected input is \(inputType[input])")
                }
                
                Section{
                    TextField("Enter the value to convert:", text: $amount)
                        .keyboardType(.decimalPad)
                 //   Text("User input amount : \(amount)")
                }
                
                Section(header: Text("Select output type:")){
                    Picker("Select input type", selection: $output){
                        ForEach(0..<outType.count){
                            Text("\(self.outType[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    // Text("the output type is : \(outType[output])")
                }
                
                Section{
                    Text("\(amount) \(inputType[input]) in \(outType[output]) is : ")
                }
            }
            .navigationBarTitle("Converter", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
