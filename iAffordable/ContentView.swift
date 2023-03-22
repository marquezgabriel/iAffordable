//
//  ContentView.swift
//  iAffordable
//
//  Created by Gabriel Marquez on 2023-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAnnualIncomeAfterTaxes: Int = 0
    @State private var totalValueProperty: Int = 0
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var isAffordable: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total annual income after Taxes", value: $totalAnnualIncomeAfterTaxes, format: .currency(code: "USD"))
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalAnnualIncomeAfterTaxes) { _ in
                            updateAffordability()
                        }
                } header: {
                    Text("Total annual income")
                        .lineLimit(1)
                }
                Section {
                    TextField("Property total value", value: $totalValueProperty, format: .currency(code: "USD"))
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalValueProperty) { _ in
                            updateAffordability()
                        }
                } header: {
                    Text("Total value of the property")
                        .lineLimit(1)
                }
                Section {
                    if isAffordable {
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
    
    private func updateAffordability() {
        if totalValueProperty <= (3 * totalAnnualIncomeAfterTaxes) {
            isAffordable = true
        } else {
            isAffordable = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
