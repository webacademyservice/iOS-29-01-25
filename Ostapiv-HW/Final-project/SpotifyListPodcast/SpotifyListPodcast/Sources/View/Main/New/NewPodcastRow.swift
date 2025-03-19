//
//  NewPodcastRow.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 19.03.2025.
//

import SwiftUI

struct NewPodcastRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popupular podcasts")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    VStack{
                        NewItem()
                        NewItem()
                        
                    }
                    VStack{
                        NewItem()
                        NewItem()
                       
                    }
                    
                }
            }
        }
    }
}

#Preview {
    NewPodcastRow()
}
