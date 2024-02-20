//
//  ContentView.swift
//  StrechingHeader
//
//  Created by HubertMac on 20/02/2024.
//

import SwiftUI

struct StretchingHeader<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        GeometryReader { geo in
            VStack(content: content)
                .frame(width: geo.size.width, height: height(for: geo))
                .offset(y: offset(for: geo))
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    func height(for proxy: GeometryProxy) -> CGFloat {
        let y  = proxy.frame(in: .global).minY
        return proxy.size.height + max(0, y)
    }
    
    func offset(for proxy: GeometryProxy)  -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return min(0, -y)
    }
}

struct ContentView: View {
    var body: some View {
        //        ScrollView{
        //            VStack{
        //                StrechingHeader {
        //                    Image("grand")
        //                        .resizable()
        //                        .scaledToFill()
        //
        //                }
        //                .frame(height: 200)
        //            }
        //        }
        //        .ignoresSafeArea()
        
        List {
            Section {
                ForEach(0..<11){
                    Text("\($0)")
                }
            } header: {
                StretchingHeader {
                    Image("grand")
                        .resizable()
                        .scaledToFill()
                    Text("Photo of grand canyon")
                
                }
                .frame(height: 250)
            }
        }
        
    }
}



#Preview {
    ContentView()
}
