//
//  ContentView.swift
//  iAffordable
//
//  Created by Gabriel Marquez on 2023-01-18.
//

import SwiftUI

struct ContentView: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Given Name",
                text: $givenName
            )
            .disableAutocorrection(true)
            TextField(
                "Family Name",
                text: $familyName
            )
            .disableAutocorrection(true)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
