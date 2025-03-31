//
//  AppBar.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 20.03.2025.
//

import SwiftUI

struct AppBar: View {
    @ObservedObject var viewModel = PodcastViewModel()
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 32)
            
            Spacer()
            Button(action: {
                Task{
                    await viewModel.fetchPodcastsFromAPI()
                }
               
            }) {
                Text("Update")
            }
        }
        .padding(.trailing, 2)
    }
}



#Preview {
    AppBar()
}
