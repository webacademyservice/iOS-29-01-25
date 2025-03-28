//
//  AppBar.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 20.03.2025.
//

import SwiftUI

struct AppBar: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 32)
            
            Spacer()
            
        }
        .padding(.trailing, 2)
    }
}

#Preview {
    AppBar()
}
