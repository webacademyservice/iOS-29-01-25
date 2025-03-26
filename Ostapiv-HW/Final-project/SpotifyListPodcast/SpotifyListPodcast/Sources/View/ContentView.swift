//
//  ContentView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 28.02.2025.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var viewModel = PodcastViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.rows.count > 0 {
                    List(viewModel.rows, id: \.title) { row in
                        NavigationLink(value: row){
                            VStack(spacing:10) {
                                HStack(spacing:12){
                                    switch row.image{
                                    case .remoute(let url):
                                        KFImage(url)
                                            .resizable()
                                            .placeholder {
                                                ProgressView()
                                            }
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(4)
                                        
                                    case .local(let imageName):
                                        Image(imageName) //інша іконка для відсутнього зображення
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    }
                                    Text(row.title)
                                        .font(.system(size: 18))
                                    Spacer()
                                }
                                HStack{
                                    Text(row.description)
                                        .font(.system(size: 12))
                                        .lineLimit(2)
                                        .foregroundColor(Color(red: 98/255.0, green: 98/255.0, blue: 98/255.0))
                                }
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
                                    Text("\(row.duration) min")
                                        .font(.system(size: 14))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                    }
                    .listStyle(.plain) // Видаляє стандартний стиль списку
                    .navigationTitle("List Podcasts") // Заголовок
                    .navigationDestination(for: PodcastViewModel.PodcastRow.self) { podcast in
                        InfoPodcastView(podcast: podcast)
                    }
                } else {
                    Text("Завантаження...")
                }
            }
            .onAppear {
                viewModel.queryChange()
            }
        }
    }
}



#Preview {
    ContentView()
}
