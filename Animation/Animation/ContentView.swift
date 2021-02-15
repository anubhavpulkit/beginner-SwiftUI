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
    @State private var AnimationAmount = 0.0
    @State private var changed = true
    
    var body: some View {
        
        print(animationAmount)
       return VStack{
            
            Spacer()
            
            Stepper("Values", value: $animationAmount.animation(.easeInOut), in: 1...10)
            
            Spacer()
            
            Button("Hello World"){
                self.animationAmount += 1
                withAnimation(.easeInOut){
                self.AnimationAmount += 360
                }
            }
            .padding(30)
            .foregroundColor(.white)
            .background(Color.yellow)
            .clipShape(Capsule())
            .rotation3DEffect(.degrees(AnimationAmount), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(animationAmount)
            .animation(.interpolatingSpring(stiffness: 30, damping: 2))
        
            
            Spacer()
            
          Button("Tap Me") {
              self.changed.toggle()
          }
          .frame(width: 200, height: 200)
          
          .animation(nil)
          .background(changed ? Color.blue : Color.red)
          .foregroundColor(.white)
          .clipShape(RoundedRectangle(cornerRadius: changed ? 60 : 0))
          .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
