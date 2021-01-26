//
//  ContentView.swift
//  ConverterAppi
//
//  Created by Pully on 24/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0
    @State private var output = 1
    @State private var amount = ""
    
    var rsult: Float{
        
        var Amount: Float = 0
        let user = Float(amount) ?? 0
        switch inputType[input] {
        case "Celsius":
            if outType[output] == "Celsius"{
                Amount = user
            }
            else if outType[output] == "Fahrenheit"{
                Amount = (user * 1.8) + 32
            }
            else if outType[output] == "kelvin"{
                Amount = user + 273.15
            }
            break
        
        case "Fahrenheit":
        if outType[output] == "Celsius"{
            Amount = (user - 32)/1.8
        }
        else if outType[output] == "Fahrenheit"{
            Amount = user
        }
        else if outType[output] == "kelvin"{
            Amount = (user + 459.67) * 5/9
        }
        break
            
        case "kelvin":
        if outType[output] == "Celsius"{
            Amount = user - 273.15
        }
        else if outType[output] == "Fahrenheit"{
            Amount = (user * 9/5) - 459.67
        }
        else if outType[output] == "kelvin"{
            Amount = user
        }
        break
            
            
        default:
            break
        }
        return Amount
    }
    
    
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
                    Text("\(amount) \(inputType[input]) in \(outType[output]) is : \(rsult, specifier: "%.2f") ")
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

