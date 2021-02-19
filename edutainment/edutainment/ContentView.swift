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
    @State private var count = 0
    @State private var animationAmount = 0.0
    
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray6]
       }
    
    
    var body: some View {
        
        let second = self.table[0]
        
        return   NavigationView{
            ZStack{
                RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 2, endRadius: 250)                                  .edgesIgnoringSafeArea(.all)
                    .blur(radius: 20)
            VStack{
                Section{
                    
                    Text("Which Multiplication table you want to practice?")
                        .bold()
                        .fontWeight(.heavy)
                        .padding(.init(top: 5, leading: 10, bottom: 0, trailing: 10))
                        .foregroundColor(.init(red: 250.0, green: 250.0, blue: 210.0))
                        .fixedSize(horizontal: false, vertical: true) //for multiple line text
                        

                    Stepper("\(practice)", value:$practice, in: 1...12 )
                        .padding(25)
                        .foregroundColor(.white)
                        
                    
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
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            .padding(20)
                            .overlay(
                                       RoundedRectangle(cornerRadius: 20)
                                           .stroke(Color.white, lineWidth: 5)
                                   )
                        }
                    }
                }
                
                if show {
                    
                    Section{
                        
                        Text("Question is:")
                            .font(.custom("Helvetica Neue", size: 20.0))
                        .bold()
                        .foregroundColor(.init(red: 250.0, green: 250.0, blue: 210.0))
                        Text("\(practice) * \(second) = ?")
                            .font(.custom("Helvetica Neue", size: 20.0))
                        .bold()
                        .foregroundColor(.init(red: 250.0, green: 250.0, blue: 210.0))
                        
                        TextField("Enter the Answer", text: $answer )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                            
                            .alert(isPresented: $alert){
                                Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("New Question"))
                                {
                                    self.newQuestion()
                                    })
                        }
                        
                        Button("  Submit  ") {
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                                self.animationAmount += 360
                            }
                            self.hideKeyboard()
                            self.alert = true
                            print(self.answer)
                            print(self.table[0])
                            print(self.practice)
                            print("\(self.practice * self.table[0])")
                            self.checkAnswer()
                            self.count += 1
                            }.padding(20)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                        
                    }.transition(.opacity)
                    
                    Spacer()
                    
                    Section{
                        Text("Your Score is: \(score).").padding(.init(top: 0, leading: 10, bottom: 5, trailing: 10))
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                        Text("You played \(count) time.").padding(.init(top: 0, leading: 10, bottom: 20, trailing: 10))
                        .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold, design: .rounded))

                    }
                }
            }.navigationBarTitle(Text("Edutainment")).navigationBarHidden(false)
                .onAppear { // part of Tap me button
                        self.animationAmount = 2
                }

        }
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
            title = "Well Done😘"
            message = "Your Answer is Correct💥 \n Lets try new one 🙌"
            score += 1
        }
        else{
            title = "Wrong😬"
            message = "Correct answer is \(correctAns) \n Lets try new question 🖖"
            score += 0
        }
    }
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
