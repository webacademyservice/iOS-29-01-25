//
//  MainView.swift
//  Course_PrudkyiDanylo_HW04
//
//  Created by Danylo Prudkyi on 13.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State var query: String = ""
    @State var selectedMonth: String = feb
    var body: some View {
        VStack(alignment: .leading) {
            Text("Розклад на місяць")
                .font(.title)
                .bold()
                .padding()
            
            
            VStack(alignment: .leading) {
                HStack {
                    TextField("Введіть місяць", text: $query)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(16)
                        .onChange(of: query) { newValue in
                            
                            if isValidMonth(newValue) {
                                selectedMonth = newValue
                            }
                        }
                }
            }
            .padding()
            
            
            Text("Події на \(selectedMonth)")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    let monthEvents = viewModel.events.filter { $0.dateEvent.month == selectedMonth }
                    
                    if monthEvents.isEmpty {
                        Text("Немає подій на цей місяць")
                            .padding()
                            .foregroundColor(.gray)
                    } else {
                        ForEach(groupEventsByDay(events: monthEvents), id: \.key) { day, events in
                            VStack(alignment: .leading) {
                                Text("День \(day)")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(events) { event in
                                    ForEach(event.nameEvent, id: \.self) { name in
                                        HStack {
                                            Text("•")
                                            Text(name)
                                                .padding(.vertical, 4)
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }
    
    
    private func isValidMonth(_ month: String) -> Bool {
        let validMonths = [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
        return validMonths.contains(month)
    }
    
    
    private func groupEventsByDay(events: [ListEvents]) -> [(key: Int, value: [ListEvents])] {
        
        var eventsByDay: [Int: [ListEvents]] = [:]
        
        for event in events {
            let day = event.dateEvent.day
            if eventsByDay[day] != nil {
                eventsByDay[day]!.append(event)
            } else {
                eventsByDay[day] = [event]
            }
        }
        
        
        return eventsByDay.sorted { $0.key < $1.key }
    }
}

#Preview {
    MainView()
}
