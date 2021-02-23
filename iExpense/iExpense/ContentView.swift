//
//  ContentView.swift
//  iExpense
//
//  Created by Pully on 19/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct secondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack{
            Text("This is second view")
                .padding(40)
            Button("Dismiss me"){
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct ContentView: View {
    
    @State private var secondViewOpen = false
    
    var body: some View {
        Button("Tap Me"){
          
            self.secondViewOpen.toggle()
        }
        .sheet(isPresented: $secondViewOpen){
            secondView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
