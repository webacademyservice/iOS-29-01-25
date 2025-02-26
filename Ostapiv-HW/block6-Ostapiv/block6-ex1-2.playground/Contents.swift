import UIKit

protocol Event: Comparable {
    var nameEvent: [String] { get }
    var dateEvent: SimpleDate { get }
}

struct SimpleDate: CustomStringConvertible {
    var description: String {
        return "\(day) \(month)"
    }
    
    let month: String
    let day: Int
}

struct ListEvents: Event {
    
    let nameEvent: [String]
    let dateEvent: SimpleDate
    
}


let feb28 = SimpleDate(month: "Cічня", day: 28)
let mar1 = SimpleDate(month: "Березня", day: 1)
let mar3 = SimpleDate(month: "Березня", day: 3)

let listWorkout = ListEvents(nameEvent: ["Прес", "Віджимання", "Аеробіка", "Гантелі"], dateEvent: feb28)
let listWorkout2 = ListEvents(nameEvent: ["Плавання", "Велосипед", "Біг"], dateEvent: mar1)
let listEventsDay = ListEvents(nameEvent: ["Спортивний зал", "День народження"], dateEvent: mar3)



func findEvent <E:Event> (events: [E], date: SimpleDate){
    

    for event in events {
        let sortedEvents = event.nameEvent.sorted()
        print("На \(date) заплановано: \(sortedEvents.joined(separator: ", "))")
    }
}

findEvent(events: [listWorkout], date: feb28)
findEvent(events: [listWorkout2], date: mar1)
findEvent(events: [listEventsDay], date: mar3)



extension Event {
    static func < (lhs: Self, rhs: Self) -> Bool {
        let sortedLhs = lhs.nameEvent.sorted()
        let sortedRhs = rhs.nameEvent.sorted()
        return sortedLhs.joined(separator: " ") < sortedRhs.joined(separator: " ")
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.nameEvent.sorted() == rhs.nameEvent.sorted()
    }
}
