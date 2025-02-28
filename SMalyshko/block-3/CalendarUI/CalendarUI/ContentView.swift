//
//  ContentView.swift
//  CalendarUI
//
//  Created by Serhii Malyshko on 27.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var journal = Journal(yearPlans: yearPlans)
    @State private var selectedDate: Date = Date()
    
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            DatePicker("Select date", selection: $selectedDate)
            TextField("Add event", text: $inputText)
            Button("Add") {
                let components = Calendar.current.dateComponents([.month, .day], from: selectedDate)
                let monthNumber = components.month ?? 1
                let monthName = Calendar.current.monthSymbols[monthNumber - 1]
                let dayNumber = components.day ?? 0
                
                var tasks = DailyTasks()
                
                let joggingEvent = Jogging(name: inputText)
                
                tasks.addEvent(events: [joggingEvent])
                
                journal.addPlan([tasks], monthName, dayNumber)
            }
            
            let components = Calendar.current.dateComponents([.month, .day], from: selectedDate)
            let monthNumber = components.month ?? 1
            let monthName = Calendar.current.monthSymbols[monthNumber - 1]
            let dayNumber = components.day ?? 0
            let events = journal.sortEvents(month: monthName, day: dayNumber)

            if events.count > 0 {
                Text("Events for \(monthName)")
                List(events, id: \.id) { event in
                    Text(event.name)
                }
            } else {
                Text("No events for this date")
            }
            
            Spacer()
        }
        .padding()
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    ContentView()
}
