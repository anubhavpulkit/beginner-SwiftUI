//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Pully on 23/02/21.
//  Copyright © 2021 catalyst. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}
