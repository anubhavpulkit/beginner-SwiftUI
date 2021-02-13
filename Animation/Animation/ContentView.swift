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
        .onAppear {
            self.animationAmount = 2
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
