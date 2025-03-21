//
//  AccountBar.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 21.03.2025.
//

import SwiftUI

struct AccountBar: View {
    // Змінна для управління темою
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false
    var body: some View {
        HStack{
            Text("Dark mode")
                .font(.body)
            
            Spacer()
            
            Toggle(isOn: $isDarkMode) {
                
            }
            .labelsHidden()
        }
        .padding(.trailing, 2)
        .onChange(of: isDarkMode) { value in
            // Зміна теми на основі стану toggle
            if value {
                // Встановлюємо темну тему
                UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .dark
            } else {
                // Встановлюємо світлу тему
                UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .light
            }
        }
    }
}



#Preview {
    AccountBar()
}
