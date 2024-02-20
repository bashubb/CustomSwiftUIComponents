//
//  ContentView.swift
//  FilteringList
//
//  Created by HubertMac on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    let users: [User] = Bundle.main.decode("users.json")
    
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
                .listStyle(.plain)
                .onAppear(perform: applyFilter)
                .onChange(of: filterString) { _ in
                    withAnimation {
                        applyFilter()
                    }
                }
            }
            .navigationTitle("Adress Book")
        }
    }
    
    func applyFilter() {
        let cleanedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedFilter.isEmpty {
            filteredItems = users
        } else {
            filteredItems = users.filter { $0.name.localizedCaseInsensitiveContains(cleanedFilter)}
        }
    }
}


#Preview {
    ContentView()
}
