FilteringList 📋
================

The `FilteringList` SwiftUI component provides a convenient way to filter a list of items based on specific key paths.

Usage
-----

1.  Copy the `FilteringList` struct into your SwiftUI project.

2.  Use the `FilteringList` view in your SwiftUI views by providing the list of items to filter, the key paths to filter on, and the content view to display for each item, like this:



```swift 
import SwiftUI

struct ContentView: View { 
  let users: [User] = Bundle.main.decode("users.json")

  var body: some View {
    FilteringList(users, filterKeys: \.name, \.address) { user in
        // Your content view here
    }
  }
}
```

Replace `users` with your list of items, `\ .name`, `\ .address` with the key paths you want to filter on, and `// Your content view here` with the view you want to display for each item.

1.  Customize the appearance and behavior of the filtering list by modifying the `applyFilter()` method and the view hierarchy inside the `FilteringList` struct.

Example
-------

Here's an example of how you can use `FilteringList` in your SwiftUI views:



```swift
import SwiftUI

struct ContentView: View {
  let users: [User] = Bundle.main.decode("users.json")

  var body: some View {
      NavigationStack {
          FilteringList(users, filterKeys: \.name, \.address) { user in
              VStack(alignment: .leading) {
                  Text(user.name)
                      .font(.headline)
                  Text(user.address)
                      .foregroundStyle(.secondary)
              }
          } .navigationTitle("Address Book")
      }
  }
}
```

Replace `"users.json"` with the name of your JSON file containing the list of items.

Preview
-------

<img src="https://github.com/bashubb/CustomSwiftUIComponents/blob/main/FilteringList/FilteringList.gif">
    
