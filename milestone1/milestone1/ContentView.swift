//
//  ContentView.swift
//  milestone1
//
//  Created by Pully on 01/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var rSelection: String{
        let selection = option.randomElement()
        return selection!
    }
    
    @State private var option = ["Rock", "Paper", "Sciesser"].shuffled()
    @State private var selectedOption = [1,2,3].shuffled()
    @State private var alort = false
    @State private var title = ""
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10){
                    VStack{
                        Text("Rock Paper and Sciesser")
                            .font(.title).bold()
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    ForEach(0..<3){num in
                        Button(action: {
                            print("\(self.option[num]) User selection") // user selection
                            self.winner(num: num)
                            print("\(self.rSelection) Robot selection") // robot selection
                        })
                        {
                            Image(self.option[num])
                                .renderingMode(.original)
                                .padding()
                        }
                    }
                    Spacer()
                        .alert(isPresented: $alort){
                            Alert(title: Text(title), message: Text("Computer choose: \(rSelection)"), dismissButton: .default(Text("Continue")){
                                self.option.shuffle()
                                self.selectedOption.shuffle()
                                self.title = ""
                                })
                    }
                    Text(rSelection)
                    .padding()
                }
            }
        }
    }
    
    func winner(num: Int)  {
//        var option[num] = option[num]
        
        if option[num] == "Rock" && rSelection == "Rock"{
             title = "Clash"
        }
        else if option[num] == "Rock" && rSelection == "Paper"{
            title = "Lose"
        }
        else if option[num] == "Rock" && rSelection == "Sciesser"{
            title = "Winer"
        }
        else if option[num] == "Paper" && rSelection == "Paper"{
            title = "Clash"
        }
        else if option[num] == "Paper" && rSelection == "Rock"{
            title = "Winer"
        }
        else if option[num] == "Paper" && rSelection == "Sciesser"{
            title = "Lose"
        }
        else if option[num] == "Sciesser" && rSelection == "Sciesser"{
            title = "Clash"
        }
        else if option[num] == "Sciesser" && rSelection == "Rock"{
            title = "Lose"
        }
        else if option[num] == "Sciesser" && rSelection == "Paper"{
            title = "Winer"
        }
         self.alort = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
