//
//  CalculatorView.swift
//  QuickSplit
//
//  Created by Sandaru Rashmika on 2024-12-06.
//

import SwiftUI

struct CalculatorView: View {
    
    @AppStorage("splitvalue") var splitValue: Double = 0
    @AppStorage("totalExpenses") var totalExpenses: Double = 0
    
    @State private var totalAmountVal = ""
    @State private var tipAmountVal = ""
    @State private var numPeopleVal = ""
    @State private var showAlert = false
    @State private var alertMessage:String = ""
    @State private var calculatedTotal: Double? = nil
    @State private var calculatedSplit: Double? = nil

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                TextField("Total Amount", text: $totalAmountVal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.decimalPad)

                TextField("Tip Amount", text: $tipAmountVal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.decimalPad)

                TextField("Number of People", text: $numPeopleVal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.decimalPad)
                

                Button("Calculate") {
                    if let result = calculateSplitValue() {
                        splitValue = result.splitAmount
                        calculatedTotal = result.totalAmount
                        calculatedSplit = result.splitAmount
                        alertMessage = "LKR \(splitValue)0"
                        showAlert = true
                    } else {
                        alertMessage = "Please enter valid values for all fields."
                        calculatedTotal = nil
                        calculatedSplit = nil
                        showAlert = true
                    }
                }
                .buttonStyle(.bordered)
                .tint(.green)
            }
            Spacer()
                .navigationTitle("QuickSplit")
        }
        .alert(isPresented: $showAlert) {
            if let _ = calculatedTotal, let _ = calculatedSplit {
                return Alert(
                    title: Text("You Owe"),
                    message: Text(alertMessage),
                    primaryButton: .default(Text("Save to Expenses")) {
                        if let split = calculatedSplit {
                            totalExpenses += split
                        }
                        clearFields()
                    },
                    secondaryButton: .cancel(Text("Cancel")) {
                        clearFields()
                    }
                )
            } else {
                return Alert(
                    title: Text("Error"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    //Function to calculate spliit value
    private func calculateSplitValue() -> (totalAmount: Double, splitAmount: Double)? {
        guard
            let totalAmount = Double(totalAmountVal),
            let tipAmount = Double(tipAmountVal),
            let numPeople = Double(numPeopleVal),
            numPeople > 0
        else {
            return nil
        }
        let total = totalAmount + tipAmount
        let split = total / numPeople
        return (total, split)
    }
    
    //Function to clear TextFields
    private func clearFields() {
        totalAmountVal = ""
        tipAmountVal = ""
        numPeopleVal = ""
    }
}

#Preview {
    CalculatorView()
}
