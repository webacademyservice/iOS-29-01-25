//
//  InfoPodcastView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 15.03.2025.
//

import SwiftUI
import Kingfisher



struct InfoPodcastView: View {
    @ObservedObject var ViewModel = InfoPdcastViewModel()
    let podcast: PodcastViewModel.PodcastRow
    
    var body: some View {
            ScrollView {
                VStack {
                    switch podcast.image{
                    case .remoute(let url):
                        KFImage(url)
                            .resizable()
                            .placeholder {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(4)
                        
                    case .local(let imageName):
                        Image(imageName) //інша іконка для відсутнього зображення
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
                .padding(.bottom, 16)
                VStack {
                    Text(podcast.title)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack (spacing:10) {
                    HStack {
                        Text("\(podcast.duration) хв")
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
                    Text(podcast.description)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding()
        .onAppear {
            ViewModel .queryChange() // Викликаємо метод для завантаження даних
        }
    }
    
}

#Preview {
    InfoPodcastView(podcast: PodcastViewModel.PodcastRow(
        title: "Sample Podcast",
        image: .local("photo"),
        description: "This is a description of the sample podcast.",
        duration: 60
    ))
}
