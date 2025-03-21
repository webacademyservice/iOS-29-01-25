//
//  AccountView.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 18.03.2025.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 24) {
                AccountBar()
            }
        }
        .padding(16)
    }
}

#Preview {
    AccountView()
}
