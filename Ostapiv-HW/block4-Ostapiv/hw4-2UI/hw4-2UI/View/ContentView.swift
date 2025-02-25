//
//  ContentView.swift
//  hw4-2UI
//
//  Created by Denis Ostapiv on 10.02.2025.
//

import SwiftUI

let tasks = [
    "Прочитати книгу",
    "Зробити зарядку",
    "Написати код",
    "Немає планів",
    "Послухати подкаст",
    "Приготувати нову страву",
    "Попрацювати над проєктом"
]

struct ContentView: View {
    
    let days: [(day: String, task: String)]
    
    init() {
        var generatedDays: [(String, String)] = []
        for day in 1...31 {
            let task = tasks[day % tasks.count]
            generatedDays.append(("День \(day)", task))
        }
        self.days = generatedDays
    }
    var body: some View {
        
        Text ("Січень")
            .font(.title)
            .fontWeight(.bold)
        
        List {
            
            ForEach(days, id: \.day) { item in
                Text("\(item.day): \(item.task)")
            }
        }
    }
}

#Preview {
    ContentView()
}


