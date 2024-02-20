//
//  ContentView.swift
//  FilteringList
//
//  Created by HubertMac on 20/02/2024.
//

import SwiftUI

struct FilteringList<T: Identifiable, Content: View>: View {
    @State private var filteredItems = [T]()
    @State private var filterString = ""
    
    let listItems: [T]
    let filterKeyPaths: [KeyPath<T, String>]
    let content: (T) -> Content
    
    var body: some View {
        VStack {
            TextField("Type to filter", text: $filterString)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            List(filteredItems, rowContent: content)
                .listStyle(.plain)
                .onAppear(perform: applyFilter)
                .onChange(of: filterString) { _ in
                    withAnimation {
                        applyFilter()
                    }
                }
        }
    }
    
    init(_ data: [T], filterKeys: KeyPath<T, String>..., @ViewBuilder rowContent: @escaping (T) -> Content) {
        listItems =  data
        filterKeyPaths = filterKeys
        content = rowContent
    }
    
    func applyFilter() {
        let cleanedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedFilter.isEmpty {
            filteredItems = listItems
        } else {
            filteredItems = listItems.filter { element in
                filterKeyPaths.contains {
                    element[keyPath: $0]
                        .localizedCaseInsensitiveContains(cleanedFilter)
                }
            }
        }
    }
}

struct ContentView: View {
    let users: [User] = Bundle.main.decode("users.json")
    
    var body: some View {
        NavigationStack {
            FilteringList(users, filterKeys: \.name, \.address) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.address)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Adress Book")
            
        }
    }
    
    
}


#Preview {
    ContentView()
}
