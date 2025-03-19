//
//  MainView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 18.03.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 32)
                Spacer()
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                    Text("Текст")
                }
            }
            .padding(.bottom, 8)
            HStack{
                PopulatPodcastRow_()
            }
            .padding(.bottom, 16)
            HStack{
                NewPodcastRow()
            }
            .padding(.bottom, 16)
            HStack{
                PopulatPodcastRow_()
            }
        }
        .padding(16)
    }
}

#Preview {
    MainView()
}
