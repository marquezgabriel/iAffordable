//
//  ContentView.swift
//  iAffordable
//
//  Created by Gabriel Marquez on 2023-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAnnualIncomeAfterTaxes:Double = 40000
    @State private var totalValueProperty:Double = 120000
    
    @FocusState private var amountIsFocused: Bool
    
    var isAffordable: Bool {
        if (totalValueProperty <= (3 * totalAnnualIncomeAfterTaxes)) {
            return true
        }
        else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total annual income - Taxes", value: $totalAnnualIncomeAfterTaxes, format: .currency(code: "USD"))
                        .focused($amountIsFocused)
                } header: {
                    Text("Total annual income")
                        .lineLimit(1)
                }
                Section {
                    TextField("Property total value", value: $totalValueProperty, format: .currency(code: "USD"))
                        .focused($amountIsFocused)
                } header: {
                    Text("Total value of the property")
                        .lineLimit(1)
                }
                Section {
                    if (totalValueProperty <= (3 * totalAnnualIncomeAfterTaxes)) {
                        Text("👍")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                        } else {
                            Text("👎")
                                .font(.system(size: 50))
                                .foregroundColor(.red)
                        }
                } header: {
                    Text("Could you afford it?")
                        .lineLimit(1)
                }
            }
            .keyboardType(.decimalPad)
            .navigationTitle("iAffordable")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
