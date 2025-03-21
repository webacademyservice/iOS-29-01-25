//
//  TrendingItem.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 20.03.2025.
//

import SwiftUI

struct TrendingItem: View {
    var podcast: PodcastViewModel.PodcastRow
    var body: some View {
        
        VStack(alignment: .leading){
            switch podcast.image {
            case .local(let imageName):
                Image(imageName)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(4)
                    .padding(.bottom, 4)
            case .remoute(let url):
                AsyncImage(url: url) { image in
                    image.resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(4)
                        .padding(.bottom, 4)
                } placeholder: {
                    ProgressView()
                }
            }
            Text (podcast.title)
                .font(.callout)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 250, alignment: .leading)
        }
    }
}

#Preview {
    TrendingItem(podcast: PodcastViewModel.PodcastRow (
        title: "This is a description of the sample podcast.",
        image: .local("photo"),
        description: "This is a description of the sample podcast.",
        duration: 60
    ))
}
