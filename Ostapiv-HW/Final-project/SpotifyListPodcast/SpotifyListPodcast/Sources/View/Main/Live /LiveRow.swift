//
//  LiveRow.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 20.03.2025.
//

import SwiftUI

struct LiveRow: View {
    @ObservedObject var viewModel = PodcastViewModel()
    let rows = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.rows.count > 0 {
                Text("Live Podcas")
                    .font(.title2)
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 16){
                            ForEach(viewModel.rows) { podcast in
                                LiveItem(podcast: podcast)
                            }
                    }
                    .frame(height: 260)
                }
            } else {
                Text("Завантаження...")
            }
        }
        .onAppear {
            viewModel.queryChange()  // Запускаємо завантаження даних
        }
    }
}

#Preview {
    LiveRow()
}
