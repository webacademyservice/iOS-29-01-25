//
//  AccountBar.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 21.03.2025.
//

import SwiftUI

struct AccountBar: View {

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        HStack{
            Text("Dark mode")
                .font(.body)
            
            Spacer()
            
            Toggle("", isOn: $isDarkMode)
                .labelsHidden()
        }
        .padding(.trailing, 2)
//        .onChange(of: isDarkMode) {
//            updateAppearance()
//        }
       
    }
    
//    private func updateAppearance() {
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let window = windowScene.windows.first {
//            window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
//        }
    }
//}



#Preview {
    AccountBar()
}
