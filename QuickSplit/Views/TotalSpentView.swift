//
//  TotalSpentView.swift
//  QuickSplit
//
//  Created by Pubudu Mihiranga on 2024-11-10.
//
import SwiftUI

struct TotalSpentView: View {
    @AppStorage("totalExpenses") private var totalExpenses: Double = 0
    var body: some View {
        NavigationStack {
            VStack {
                Text("Overall you spent")
                    .font(.title2)
                    .padding(.top)
                Text("LKR \(totalExpenses, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .padding(.bottom)

                Button("Reset") {
                    resetExpenses()
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .padding(.top)
            }
            .navigationTitle("Expenses")
        }
    }

    private func resetExpenses() {
        totalExpenses = 0
    }
}
#Preview {
    TotalSpentView()
}
