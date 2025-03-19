//
//  NewItem.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 19.03.2025.
//

import SwiftUI

struct NewItem: View {
    var body: some View {
       
        HStack{
            Image("photo")
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(4)
            VStack(alignment: .leading){
                Text("Elementary Podcasts")
                    .font(.callout)
                    .padding(.bottom,8)
                Text("Elementary Podcasts by the British Council")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "ellipsis")
  
        }
    }
}

#Preview {
    NewItem()
}
