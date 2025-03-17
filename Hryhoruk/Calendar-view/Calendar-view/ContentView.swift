//
//  ContentView.swift
//  Calendar-view
//
//  Created by Oleksandr Hryhoruk on 2025-02-25.
//

import SwiftUI

struct SimpleDate: CustomStringConvertible {
    let month: String
    let day: Int
    
    var description: String {
        return "\(day) \(month)"
    }
}

protocol Event: Comparable {
//    var nameEvent: [String] { get }
//    var dateEvent: SimpleDate { get }
    var name: String { get }
}

//struct ListEvents: Event, Identifiable {
//    
////    let nameEvent: [String]
////    let dateEvent: SimpleDate
//    let name: String
//    
//    var id: String {
//        return name
//    }
//    
//}

struct ContentView: View {
    @State private var journal = Journal()
    @State private var selectDate: Date = Date()
    @State private var inputText: String = ""
    @State private var SimpleDate: SimpleDate?
    
    var body: some View {
        VStack {
            DatePicker("Please select date", selection: $selectDate)
            TextField("Add event", text: $inputText)
            Button("Add Event") {
                let components = Calendar.current.dateComponents([.month, .day], from: selectDate)
                let monthNumber = components.month ?? 1
                let monthName = Calendar.current.monthSymbols[monthNumber - 1]
                let dayNumber = components.day ?? 0
                journal.addEvent(toMonth: monthName, day: dayNumber, event: SimpleEvent(name: inputText))
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
       //     let events = eventsString.components(separatedBy: .newlines).filter { !$0.isEmpty }
            let eventsByDay: [[any Event]] = journal.getEventsForMonth(month: monthName)
            
            if !eventsByDay.isEmpty {
                Text("Events for \(monthName):")
                
                let eventDescriptionByDay: [String] = eventsByDay .map {events in
                    events.map{$0.name}.joined(separator: ", ")
                }
                List(eventDescriptionByDay, id: \.self) {descriptionForDay in
                    Text(descriptionForDay)
                }
            } else {
                Text("No events planned for \(monthName)")
            }
        }
        .padding()
    }
}

//extension Event {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//        let sortedLhs = lhs.nameEvent.sorted()
//        let sortedRhs = rhs.nameEvent.sorted()
//        return sortedLhs.joined(separator: " ") < sortedRhs.joined(separator: " ")
//    }
//    
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.nameEvent.sorted() == rhs.nameEvent.sorted()
//    }
//}

#Preview {
    ContentView()
}
