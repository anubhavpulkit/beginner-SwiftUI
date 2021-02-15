//
//  ContentView.swift
//  Animation
//
//  Created by Pully on 13/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .frame(width: 200, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .offset(dragAmount) // pass Xand Y coordinates of card
        .gesture(
            DragGesture()
                .onChanged {self.dragAmount = $0.translation }
                .onEnded { _ in self.dragAmount = .zero } // when user lift there fingure
        )
            .animation(.interpolatingSpring(stiffness: 20, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
