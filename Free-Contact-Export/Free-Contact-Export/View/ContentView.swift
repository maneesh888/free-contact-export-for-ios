//
//  ContentView.swift
//  Free-Contact-Export
//
//  Created by Maneesh M on 10/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                        .padding()
                }
            }
            .navigationTitle("Import Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
