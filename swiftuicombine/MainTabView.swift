//
//  MainTabView.swift
//  swiftuicombine
//
//  Created by air on 4/30/25.
//

import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 0
    var body: some View {
        TabView(selection: $tabIndex) {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            NewPostView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            Text("Reals")
                .tabItem {
                    Image(systemName: "movieclapper")
                }
                .tag(3)
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
