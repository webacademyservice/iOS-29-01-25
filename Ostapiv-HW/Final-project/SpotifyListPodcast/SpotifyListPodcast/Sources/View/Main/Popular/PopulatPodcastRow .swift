//
//  PopulatPodcastRow .swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 19.03.2025.
//

import SwiftUI

struct PopulatPodcastRow_: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popupular podcasts")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    PopularItem()
                    PopularItem()
                    PopularItem()
                    PopularItem()
                }
                .frame(height: 185)
            }
        }
    }
}

#Preview {
    PopulatPodcastRow_()
}
