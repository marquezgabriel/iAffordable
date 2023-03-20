//
//  ContentView.swift
//  iAffordable
//
//  Created by Gabriel Marquez on 2023-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAnnualIncomeAfterTaxes:Double = 0.0
    @State private var totalValueProperty:Double = 0.0

    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter total annual income", value: $totalAnnualIncomeAfterTaxes, format: .currency(code: "USD"))
                }
                Section {
                    TextField("Enter property total value", value: $totalValueProperty, format: .currency(code: "USD"))
                }
            }
            .navigationTitle("iAffordable")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
