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
//        Text("Hello, World!")
        Button("Tap me"){
            self.animationAmount += 0.2
        }
    .padding(50)
        .foregroundColor(.white)
        .background(Color.red)
    .clipShape(Capsule())
    .scaleEffect(animationAmount)
   //     .animation(.interpolatingSpring(stiffness: 50, damping: 1))
   // .blur(radius: (animationAmount - 1 ) * 3)
            .animation( Animation.easeInOut(duration: 1)
                   .repeatForever(autoreverses: true)
                .delay(1))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
