//
//  ContentView.swift
//  Calendar-view
//
//  Created by Oleksandr Hryhoruk on 2025-02-25.
//

import SwiftUI

struct ContentView: View {
    @State private var journal = Journal()
    @State private var selectDate: Date = Date()
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            DatePicker("Please select date", selection: $selectDate)
            TextField("Add event", text: $inputText)
            Button("Add Event") {
                let components = Calendar.current.dateComponents([.month, .day], from: selectDate)
                let monthNumber = components.month ?? 1
                let monthName = Calendar.current.monthSymbols[monthNumber - 1]
                let dayNumber = components.day ?? 0
                journal.addEvent(toMonth: monthName, day: dayNumber, event: inputText)
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            let components = Calendar.current.dateComponents([.month, .day], from: selectDate)
            let monthNumber = components.month ?? 1
            let monthName = Calendar.current.monthSymbols[monthNumber - 1]
            //let dayNumber = components.day ?? 0
            let eventsString = journal.getMonthlyPlan(month: monthName)
            let events = eventsString.components(separatedBy: .newlines).filter { !$0.isEmpty }
            if events.count > 0 {
                Text("Events for \(monthName):")
                
                List (events, id: \.self){event in
                    Text(event)
                    
                }
            } else {
                Text("No events planned for \(monthName)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
