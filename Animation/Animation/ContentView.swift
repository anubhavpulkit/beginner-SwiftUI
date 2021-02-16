//
//  ContentView.swift
//  Animation
//
//  Created by Pully on 13/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tans = false
    
    var body: some View {
        
        VStack{
            
            Button("Tap me"){
                withAnimation{
                self.tans.toggle()
                }
            }
            
            if tans{
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
            }
            else{
                Rectangle()
                .frame(width: 200, height: 200)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
