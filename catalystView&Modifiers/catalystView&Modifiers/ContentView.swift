//
//  ContentView.swift
//  catalystView&Modifiers
//
//  Created by Pully on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            title(text: "Hello World!")
            title(text: "how's you?")
                .foregroundColor(.green)
            Text("Are you fine?")
                .modifier(small())
        }
      //  .blur(radius: 5)
    }
}

// coustum modifiers
struct small: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.red)
            .foregroundColor(.white)
            .font(.largeTitle)
    }
}

// view composition
struct title: View {
    var text: String
    var body: some View{
        
        Text(text)
            //.foregroundColor(.white)
            .padding()
            .font(.largeTitle)
            .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
