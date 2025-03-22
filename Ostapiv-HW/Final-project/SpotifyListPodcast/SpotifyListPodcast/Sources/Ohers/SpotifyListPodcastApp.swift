//
//  SpotifyListPodcastApp.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 28.02.2025.
//

import SwiftUI

@main
struct SpotifyListPodcastApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    init() {
        updateAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .onAppear {
                        updateAppearance()
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Podcasts")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                AccountView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
            }
        }
    }
    
    
    private func updateAppearance() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        }
    }
}
