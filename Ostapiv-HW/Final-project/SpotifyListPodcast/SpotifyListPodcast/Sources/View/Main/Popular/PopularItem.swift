//
//  PopularItem.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 19.03.2025.
//

import SwiftUI

struct PopularItem: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Image("photo")
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(4)
                .padding(.bottom, 4)
            Text ("Elementary Podcasts")
                .font(.callout)
        }
    }
}

#Preview {
    PopularItem()
}
