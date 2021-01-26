//
//  ContentView.swift
//  FlagGuess
//
//  Created by Pully on 26/01/21.
//

import SwiftUI

struct ContentView: View {
   @State private var country = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
   @State private var correctAns = Int.random(in: 0...2) // we use correctAns variable at 2 place 1st to place as a statement in text and 2nd in flag tapped function to compaire whether user select the same value which is present in Title or not.
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
            
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            
        VStack(spacing: 30){
            
        VStack{
            
            Text("Tap the flag of:")
                .foregroundColor(.white)
            
            Text(country[correctAns])
                .foregroundColor(.white)
                .bold()
        }
        
            ForEach(0..<3) { number in
                Button(action: {
                    // Showing screen = true and alert is present from this method
                    // we use number for 2 purose 1st- to present UI one by one through ForEach and 2nd is we pass the value of number which user select.
                    flagTapped(number: number)
                }){
                    Image(self.country[number])
                        .renderingMode(.original)
                }
            }
            Spacer()
            .alert(isPresented: $showingScore){
                    Alert(title: Text(scoreTitle), message: Text("Your score is: "), dismissButton: .default(Text("Continue")){
                        self.askQuestion() // After a attmept the flags and target value suffle.
                    })
                }
        }
    }
    }
    
    // This function suffle the target value and flags
    func askQuestion() {
        country.shuffle()
        correctAns = Int.random(in: 0...2)
    }
    
    func flagTapped(number: Int){
        
        // We get number for UI button the value of button is = button selected by user from 0...2 and correctAns is random number btw 0..2( and if random number = number which is slected by user is same that means answer is correct.
        
        if number == correctAns{
            scoreTitle = "Correct"
        }
        else{
            scoreTitle = "wrong"
        }
        //call alert screen
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
