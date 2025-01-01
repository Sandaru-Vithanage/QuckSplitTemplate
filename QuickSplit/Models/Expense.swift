//
//  Expense.swift
//  QuickSplit
//
//  Created by Sandaru Rashmika on 2024-12-06.
//

import Foundation

struct Expense: Hashable {
    let title: String
    let totalAmount: Double
    let numberOfPeople: Int
    let splitAmount: Double
}
