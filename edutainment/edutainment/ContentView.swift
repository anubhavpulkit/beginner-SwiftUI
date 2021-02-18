//
//  ContentView.swift
//  edutainment
//
//  Created by Pully on 17/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var practice = 1
    @State private var table = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].shuffled()
    @State private var show = false
    @State private var buttonTitle = ["Ask Question", "Change Question"]
    @State private var answer = ""
    @State private var alert = false
    @State private var title = ""
    @State private var message = ""
    @State private var score = 0
    
    
    var body: some View {
    
        let second = self.table[0]
        
     return   NavigationView{
            VStack{
            Section{
                
              Text("Which Multiplication table you want to practice")
                
              Stepper("\(practice)", value:$practice, in: 1...12 )
                .padding(15)
 
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 8, damping: 4)){
                        self.show = true
                    }
                }){
                    if show {
                        Text("")
                    }
                    else {
                        Text("Ask Question")
                    }
                  }
                }
                
                if show {
                    
                    Section{
                        
                        Text("Question is:")
                        Text("\(practice) * \(second) = ?")
                        
                        TextField("Enter the Answer", text: $answer )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                        
                            .alert(isPresented: $alert){
                                Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Next Question"))
                                    {
                                    self.newQuestion()
                                    })
                        }
                        
                        Button("Submit") {
                            self.hideKeyboard()
                            self.alert = true
                            print(self.answer)
                            print(self.table[0])
                            print(self.practice)
                            print("\(self.practice * self.table[0])")
                            self.checkAnswer()
                        }
                        
                    }.transition(.opacity)
                    Spacer()
                }
            }.navigationBarTitle("Edutainment")
        }
    }
    
    func newQuestion(){
        table.shuffle()
        answer = ""
    }
    
    func checkAnswer() {
        let correctAns = practice * table[0]
        let userAns = Int(answer) ?? 0
        
        if correctAns == userAns{
            title = "Well Done"
            message = "Answer is Correct"
        }
        else{
            title = "Wrong"
            message = "Correct answer is \(correctAns)"
        }
    }
//
//    func alertMess() {
//
//    }
    
    }
#if canImport(UIKit)
 extension View {
     func hideKeyboard() {
         UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
 }
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
