//
//  MainView.swift
//  Course_PrudkyiDanylo_HW04
//
//  Created by Danylo Prudkyi on 13.02.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isRefreshing = false
    var body: some View {
        let calendar: [Int: String] = [1: withFriends, 2: buyProducts, 3: homeWork, 4: watchingMovies, 5: goToTheGym, 12: attendLecture, 16: goToTheGym, 22: withFriends, 23: studySwift]
        VStack {
            Text("Розклад на місяць")
                .font(.largeTitle)
                .padding()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(1...30, id: \ .self) { day in
                        HStack {
                            Text("День \(day)")
                            
                            Spacer()
                            
                                .font(.headline)
                                .frame(width: 100, alignment: .leading)
                            Text(calendar[day] ?? "Немає планів")
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}

