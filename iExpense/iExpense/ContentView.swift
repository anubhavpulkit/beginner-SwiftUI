//
//  ContentView.swift
//  iExpense
//
//  Created by Pully on 19/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var secondName: String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Taylor", secondName: "Swift")
    
    var body: some View {
        
        VStack{
            Button("Save User"){
                
                let encode = JSONEncoder()
                if let data = try? encode.encode(self.user){
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
            Text(user.firstName)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
