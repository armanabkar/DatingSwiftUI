//
//  TabsView.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/26/22.
//

import SwiftUI

struct TabsView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Home")
                }
            
            MessagesView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .accentColor(.pink)
        .task {
            await homeViewModel.getCharacters()
            await homeViewModel.getSuggestions()
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .previewDevice("iPhone 13 Pro")
    }
}

