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
            
            if viewModel.rows.count > 0 {
                
                List(viewModel.rows, id: \.title) { row in
                    VStack {
                        HStack{
                            switch row.image{
                            case .remoute(let url):
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(4)
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
                                .font(.system(size: 16))
                            Spacer()
                        }
                        Text(row.description)
                            .font(.system(size: 12))
                            .lineLimit(2)
                            .foregroundColor(Color(red: 98/255.0, green: 98/255.0, blue: 98/255.0))
                        HStack{
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                            Image(systemName: "arrow.down.app")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                            Spacer()
                            Text("Тривалість \(row.duration) хв")
                                .font(.system(size: 14))
                            
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)  // Це забезпечить, щоб List заповнював весь доступний простір
                .listStyle(PlainListStyle()) // Задає простий стиль списку
                
                
            } else {
                Text("Завантаження...")
            }
        }
//        .padding()
        .onAppear {
            viewModel.queryChange()
        }
    }
}



#Preview {
    ContentView()
}
