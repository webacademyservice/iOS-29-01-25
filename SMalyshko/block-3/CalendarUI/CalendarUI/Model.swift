//
//  Modal.swift
//  CalendarUI
//
//  Created by Serhii Malyshko on 27.02.2025.
//

import UIKit

protocol Event: Hashable {
    var id: UUID { get }
    var name: String { get}
}

protocol Payable {
    var cost: Int { get }
}

protocol PhysicalExercises: Event {}

protocol Entertainment: Event, Payable {}

struct Jogging: PhysicalExercises {
    let id = UUID()
    let name: String
}

struct GoToCinema: Entertainment {
    let id = UUID()
    let name: String
    let cost: Int
}

struct YogaSession: PhysicalExercises {
    let id = UUID()
    let name: String
}

struct Dating: Entertainment {
    let id = UUID()
    let name: String
    let cost: Int
}

struct AnyEvent: Event, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(event)
    }
    
    static func == (lhs: AnyEvent, rhs: AnyEvent) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    let event: any Event
    var name: String {
        return event.name
    }
    var id: UUID {
        return event.id
    }
}

extension Event {
    func eraseToAnyEvent() -> AnyEvent {
        return AnyEvent(event: self)
    }
}

struct DailyTasks: Hashable {
    var events: [AnyEvent] = []
    
    mutating func addEvent(events: [any Event]) {
        let anyEvents = events.map { event in
            event.eraseToAnyEvent()
        }
        self.events.append(contentsOf: anyEvents)
    }
    
    var physicalExercises: Array<any PhysicalExercises> {
        guard !events.isEmpty else {
            return []
        }
        return self.events.compactMap { anyEvent in
            anyEvent.event as? any PhysicalExercises
        }
    }
    
    var entertainments: Array<any Entertainment> {
        return self.events.compactMap { anyEvent in
            if let entertainmentEvent = anyEvent.event as? any Entertainment {
                return entertainmentEvent
            } else {
                return nil
            }
        }
    }
}

typealias DailyPlans = Set<DailyTasks>

extension Jogging: CustomStringConvertible {
    var description: String {
        return "Jogging: \(name)"
    }
}

extension GoToCinema: CustomStringConvertible {
    var description: String {
        return "Go To Cinema: \(name), cost: \(cost)"
    }
}

extension YogaSession: CustomStringConvertible {
    var description: String {
        return "Yoga Session: \(name)"
    }
}

extension Dating: CustomStringConvertible {
    var description: String {
        return "Dating: \(name), cost: \(cost)"
    }
}

extension DailyTasks: CustomStringConvertible {
    var description: String {
        return "Physical Exercises: \(physicalExercises), Entertainment: \(entertainments)"
    }
}

func createMonthlyPlans(plans: DailyPlans = [], numOfDays: Int = 30) -> [DailyPlans] {
    var monthlyPlans: [DailyPlans] = []
    
    for day in 1...numOfDays {
        var dailyTasks = DailyPlans()
        dailyTasks.insert(DailyTasks())
        monthlyPlans.append(dailyTasks)
    }
    
    return monthlyPlans
}

typealias MothPlans = Dictionary<String, Array<DailyPlans>>

typealias YearPlans = Dictionary<String, Array<DailyPlans>>

typealias MonthMap = Dictionary<String, Int>

func createYearPlans(dailyPlans: DailyPlans = []) -> YearPlans {
    var monthMap: MonthMap  = [
        "January": 31,
        "February": 28,
        "March": 31,
        "April": 30,
        "May": 31,
        "June": 30,
    ]
    
    var yearPlan = YearPlans()
    
    
    for (key, value) in monthMap {
        yearPlan[key] = createMonthlyPlans(plans: dailyPlans, numOfDays: value)
    }
    
    return yearPlan
}

struct Journal {
    var yearPlans: YearPlans
    
    func getMonthlyPlans(month: String) -> Array<DailyPlans> {
        guard let dailyPlans = self.yearPlans[month] else {
            print("Невірно вказаний місяць")
            return []
        }
        
        return dailyPlans
    }
    
    mutating func addPlan(_ plan: DailyPlans, _ month: String, _ day: Int) {
        yearPlans[month]?[day - 1] = plan
    }
    
    func printMonthlyPlans(_ month: String) -> Array<DailyPlans> {
        guard let dailyPlans = self.yearPlans[month] else {
            print("Невірно вказаний місяць")
            return []
        }
        
        return dailyPlans
    }
    
    func getPlans(eventType: String, month: String, day: Int) -> Array<any Event> {
        if let tasks = self.yearPlans[month]?[day - 1] {
            for dailyTask in tasks {
                if eventType == "PhysicalExercises" {
                    return dailyTask.physicalExercises as Array<any Event>
                }
                if eventType == "Entertainment" {
                    return dailyTask.entertainments as Array<any Event>
                }
            }
        }
        
        return []
    }
    
    subscript(month month: String, day day: Int) -> DailyPlans? {
        get {
            return self.yearPlans[month]?[day - 1]
        }
    }
}

extension Journal {
    func sortEvents(month: String, day: Int) -> Array<any Event> {
        var physicalExercises = self.getPlans(eventType: "PhysicalExercises", month: month, day: day)
        var entertainments = self.getPlans(eventType: "Entertainment", month: month, day: day)
        
        var unitedEvents: Array<any Event> = physicalExercises + entertainments
        
        return unitedEvents.sorted { $0.name < $1.name }
        
    }
}

var yearPlans = createYearPlans()

let cinemaEvent = GoToCinema(name: "Watch Avatar", cost: 300)
let joggingEvent = Jogging(name: "Morning Jog")
let yogaEvent = YogaSession(name: "OM!")
let datingEvent = Dating(name: "Dating with my girlfriend", cost: 500)

var feb25 = DailyTasks()

var feb28 = DailyTasks()

var journal = Journal(yearPlans: yearPlans)

