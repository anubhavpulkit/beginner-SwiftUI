import SwiftUI
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var tipPercentage = 1
    @State private var numberOfPeople = 2
    var tipPercentages = ["0","5","10","15","20"]
    
    var totalPerPerson: Double {
        let amount = Double(checkAmount) ?? 0
        let tipP = Double(tipPercentages[tipPercentage])!
        let people = Double(numberOfPeople + 1)
        
        let tipA = (tipP * amount) / 100
        print("The tipA is \(tipA)")
        
        let total = Double((amount + tipA) / people)
        return total
    }
    var condition: Bool{
        let check = Double(tipPercentages[tipPercentage])!
        var option = false
        if check == 0{
            option = true
        }
        return option
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("Enter amount to pay:", text: $checkAmount)
                         .keyboardType(.decimalPad)
                     Text("Cost to pay is: \(checkAmount)")
                 }
                Section(header: Text("Select Tip %")){
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
                                                   ForEach(1..<10){
                                                        Text("\($0) people")
                                                    }
                                                }
                     }
                     }
                Section(header: Text("Per person Pay:")){
                                     Text("$\(totalPerPerson, specifier: "%.2f")")
                                        .foregroundColor(condition ? .red : .blue)
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


