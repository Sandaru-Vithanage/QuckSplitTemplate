//
//  RootView.swift
//  QuickSplit
//
//  Created by Sandaru Rashmika on 2024-12-06.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationView{
                CalculatorView()
            }.tabItem{
                Label("Calculator", systemImage: "calendar.badge.checkmark")
                
            }
            NavigationView{
                TotalSpentView()
            }.tabItem{
                Label("Expenses", systemImage:"list.bullet")
            }
        }
    }
}
#Preview {
    RootView()
}
