//
//  InfoPodcastView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 15.03.2025.
//

import SwiftUI

struct InfoPodcastView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(4)
                }
                .padding(.bottom, 16)
                VStack {
                    Text("Selects: How the Flu Works")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack (spacing:10) {
                    HStack {
                        Text("Тривалість: 63 хв")
                            .font(.system(size: 14))
                        Spacer()
                        Text("25.01.2025")
                            .font(.system(size: 14))
                    }
                }
                .padding(.bottom, 10)
                VStack {
                    HStack(spacing:12){
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Image(systemName: "square.and.arrow.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Spacer()
                        
                        Button(action: {
                            print("Кнопка натиснута")
                        }) {
                            
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.white)
                                Text("Play")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(width: 120, height: 48)
                            .background(Color.green)
                            .cornerRadius(4)
                        }
                    }
                }
                .padding(.bottom, 10)
                VStack {
                    Text("Every year the flu virus makes the rounds, laying up young and old alike for days before moving on to another hapless victim. But flu viruses can mutate and once in awhile they turn into something much deadlier, a pandemic that can kill millions. Learn all about it with Josh and Chuck in this classic episode.Every year the flu virus makes the rounds, laying up young and old alike for days before moving on to another hapless victim. But flu viruses can mutate and once in awhile they turn into something much deadlier, a pandemic that can kill millions. Learn all about it with Josh and Chuck in this classic episode.Every year the flu virus makes the rounds, laying up young and old alike for days before moving on to another hapless victim. But flu viruses can mutate and once in awhile they turn into something much deadlier, a pandemic that can kill millions. Learn all about it with Josh and Chuck in this classic episode.Every year the flu virus makes the rounds, laying up young and old alike for days before moving on to another hapless victim. But flu viruses can mutate and once in awhile they turn into something much deadlier, a pandemic that can kill millions. Learn all about it with Josh and Chuck in this classic episode.")
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding()
        }
    }
    
}

#Preview {
    InfoPodcastView()
}
