//
//  ContentView.swift
//  Animation
//
//  Created by Pully on 13/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount: CGFloat = 1.0
    var body: some View {
        
        print(animationAmount)
       return VStack{
            
            Spacer()
            
            Stepper("Values", value: $animationAmount.animation(.easeInOut), in: 1...10)
            
            Spacer()
            
            Button("Hello World"){
                self.animationAmount += 1
            }
            .padding(30)
            .foregroundColor(.white)
            .background(Color.yellow)
            .clipShape(Capsule())
            .scaleEffect(animationAmount)
          //  .animation(.interpolatingSpring(stiffness: 30, damping: 2))
            
            Spacer()
            
            Button("Tap Me") {
                // self.animationAmount += 1
            }
                .padding(20)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeOut(duration: 1)
                            .repeatForever(autoreverses: true)
                )
            )
                .onAppear { // part of Tap me button
                    self.animationAmount = 2
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
