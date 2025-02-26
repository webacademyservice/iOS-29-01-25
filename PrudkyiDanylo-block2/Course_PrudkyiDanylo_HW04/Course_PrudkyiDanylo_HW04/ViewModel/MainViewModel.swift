//
//  MainViewModel.swift
//  Course_PrudkyiDanylo_HW04
//
//  Created by Danylo Prudkyi on 24.02.2025.
//

import Foundation

class MainViewModel : ObservableObject {
    @Published var events: [ListEvents] = []
    
    init() {
        loadEvents()
    }
    func loadEvents() {
        let febTen = SimpleDate(month: feb, day: 10)
        let marchOne = SimpleDate(month: mar, day: 1)
        let febTwenty = SimpleDate(month: feb, day: 10)
        let marchTen = SimpleDate(month: feb, day: 10)
        let aprOne = SimpleDate(month: feb, day: 10)
        let aprTen = SimpleDate(month: feb, day: 10)
        let mayTen = SimpleDate(month: feb, day: 10)
        
        events = [
            ListEvents(nameEvent: [withFriends, buyProducts], dateEvent: febTen),
            ListEvents(nameEvent: [homeWork, watchingMovies], dateEvent: marchOne),
            ListEvents(nameEvent: [goToTheGym, attendLecture], dateEvent: febTwenty),
            ListEvents(nameEvent: [studySwift], dateEvent: marchTen),
            ListEvents(nameEvent: [withFriends, buyProducts], dateEvent: aprOne),
            ListEvents(nameEvent: [studySwift], dateEvent: aprTen),
            ListEvents(nameEvent: [goToTheGym, attendLecture], dateEvent: mayTen)
            ]
    }
    func findEvents(date: SimpleDate) -> [ListEvents] {
        return events.filter { $0.dateEvent.month == date.month && $0.dateEvent.day == date.day
        }
    }
}
