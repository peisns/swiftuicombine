//
//  MainTabView.swift
//  swiftuicombine
//
//  Created by air on 4/30/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("NewPost")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Reals")
                .tabItem {
                    Image(systemName: "movieclapper")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
