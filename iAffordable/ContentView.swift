//
//  ContentView.swift
//  iAffordable
//
//  Created by Gabriel Marquez on 2023-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAnnualIncomeAfterTaxes: String? = nil
    @State private var totalValueProperty: String? = nil
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var isAffordable: Bool = true
    
    // Computed properties
    var totalAnnualIncomeBinding: Binding<String> {
        Binding<String>(
            get: { totalAnnualIncomeAfterTaxes ?? "" },
            set: { totalAnnualIncomeAfterTaxes = $0.isEmpty ? nil : $0 }
        )
    }

    var totalValuePropertyBinding: Binding<String> {
        Binding<String>(
            get: { totalValueProperty ?? "" },
            set: { totalValueProperty = $0.isEmpty ? nil : $0 }
        )
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total annual income after Taxes", text: totalAnnualIncomeBinding)
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalAnnualIncomeAfterTaxes) { _ in
                            updateAffordability()
                        }
                        .onTapGesture {
                            totalAnnualIncomeAfterTaxes = ""
                        }
                } header: {
                    Text("Total annual income")
                        .lineLimit(1)
                }
                Section {
                    TextField("Property total value", text: totalValuePropertyBinding)
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                        .onChange(of: totalValueProperty) { _ in
                            updateAffordability()
                        }
                        .onTapGesture {
                            totalValueProperty = ""
                        }
                } header: {
                    Text("Total value of the property")
                        .lineLimit(1)
                }
                Section {
                    if isAffordable {
                        Text("👍✅")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                    } else {
                        Text("👎🚩")
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
        let income = Int(totalAnnualIncomeAfterTaxes ?? "0") ?? 0
        let propertyValue = Int(totalValueProperty ?? "0") ?? 0
        
        if propertyValue <= (3 * income) {
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
