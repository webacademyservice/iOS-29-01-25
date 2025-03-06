//
//  ContentView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 28.02.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PodcastViewModel()
    
    var body: some View {
        VStack {
            //            if let podcastResponse = viewModel.podcastResult?.data?.podcastUnionV2?.episodesV2?.items {
            //                List(podcastResponse, id: \.uid) { response in
            //                    HStack{
            //                        if let coverArt = response.entity?.data?.coverArt,
            //                           let firstSource = coverArt.sources?.first,
            //                           let urlString = firstSource.url,
            //                           let url = URL(string: urlString) {
            //                            AsyncImage(url: url) { image in
            //                                image.resizable()
            //                                    .scaledToFit()
            //                                    .frame(width: 50, height: 50)
            //                            } placeholder: {
            //                                ProgressView()
            //                            }
            //                        } else {
            //                            Image("photo") //інша іконка для відсутнього зображення
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(width: 50, height: 50)
            //                        }
            //                        Text(response.entity?.data?.name ?? "No name")
            //                    }
            //                }
            //
            if viewModel.rows.count > 0 {
                
                List(viewModel.rows, id: \.title) { row in
                    HStack{
                        switch row.image{
                        case .remoute(let url):
                            AsyncImage(url: url) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                ProgressView()
                            }
                        case .local(let imageName):
                            Image(imageName) //інша іконка для відсутнього зображення
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                        Text(row.title)
                    }
                }
                
            } else {
                Text("Завантаження...")
            }
        }
        .padding()
        .onAppear {
            viewModel.queryChange()
        }
    }
}



#Preview {
    ContentView()
}
