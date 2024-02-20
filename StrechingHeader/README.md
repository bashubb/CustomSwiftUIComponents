
StretchingHeader 🚀
===================

The `StretchingHeader` SwiftUI component allows you to create a stretching header effect, typically used in scrollable views like lists or scroll views.

Usage
-----

1.  Copy the `StretchingHeader` struct into your SwiftUI project.

2.  Use the `StretchingHeader` view in your SwiftUI views by wrapping your content inside it, like this:

```swift
import SwiftUI

struct ContentView: View {

    var body: some View {

        StretchingHeader {

            // Your content here

        }

    }

}
```

Replace `// Your content here` with the content you want to display under the stretching header.

1.  Customize the height and appearance of the stretching header by modifying the `height(for:)` and `offset(for:)` functions within the `StretchingHeader` struct.

2.  You can integrate `StretchingHeader` with scrollable views like `List` or `ScrollView` by using it as a header, as shown in the example below:

```swift
List {

    Section {

        ForEach(0..<100) { index in

            Text("\(index)")

        }

    } header: {

        StretchingHeader {

            // Your header content here

        }

        .frame(height: 250)

    }

}
```

Replace `// Your header content here` with the content you want to display in the stretching header.

Example
-------

Here's an example of how you can use `StretchingHeader` in your SwiftUI views:

```swift 
import SwiftUI

struct ContentView: View {

    var body: some View {

        StretchingHeader {

            Image("header_image")

                .resizable()

                .scaledToFill()

            Text("Header Title")

                .font(.largeTitle)

                .foregroundColor(.white)

        }

        .frame(height: 200)

    }

}
```

Replace `"header_image"` with the name of your header image.

Preview
---------

<img src="https://github.com/bashubb/CustomSwiftUIComponents/blob/main/StretchingHeader.gif">
