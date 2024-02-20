//
//  ContentView.swift
//  FilteringListExample
//
//  Created by Paul Hudson on 06/06/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let users = Bundle.main.decode([User].self, from: "user.json")
    
    @State private var filteredItems = [User]()
    @State private var filterString = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type to filter", text: $filterString)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
               
                List(filteredItems) {user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.address)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Adress Book")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
