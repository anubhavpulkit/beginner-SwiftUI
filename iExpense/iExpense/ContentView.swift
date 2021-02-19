//
//  ContentView.swift
//  iExpense
//
//  Created by Pully on 19/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Count = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        
        
        Button("Tap Me \(Count)"){
            self.Count += 1
            UserDefaults.standard.set(self.Count, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
