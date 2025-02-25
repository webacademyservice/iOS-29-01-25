import Foundation
import UIKit

//MARK: - 1. Створення Set для плану на день
var dailyPlan: Set<String> = ["Прокинутись", "Поснідати", "Піти на роботу", "Сходити в спортазал, Зробити домашнє завдання"]

//MARK: - 2. Масив планів на місяць
var monthlyPlan = Array(repeating: dailyPlan, count: 30)

typealias DailyPlan = Set<String>
typealias MonthlyPlan = [DailyPlan]

func calendarForMonth (typicalDay: DailyPlan = [], numberOfDays: Int = 30) -> [DailyPlan] {
    .init(repeating: typicalDay, count: numberOfDays)
}

//MARK: - 3. Словник планів на рік
typealias YearPlan = [String: MonthlyPlan]

func calendarForYear(typicalDay: DailyPlan = []) -> YearPlan {
    let mothesOfTheYear = ["January": 31, "February": 28, "March": 31]
    var yearPlan = YearPlan()
    
    for monthIteretor in mothesOfTheYear {
        yearPlan [monthIteretor.key] = calendarForMonth(typicalDay: typicalDay, numberOfDays: monthIteretor.value)
    }
    return yearPlan
}
//MARK: - 4. Функція для виводу планів на місяць
func printMonth(month: MonthlyPlan) {
    var dayNumber = 1
    for day in month {
        print("day\(dayNumber): \(day)")
        dayNumber += 1
    }
}
//
var planForOneMonth = calendarForMonth()
planForOneMonth[4] = ["Зробити домашню роботу"]
planForOneMonth[4].insert("сходити в кіно")

var planOfTheYear = calendarForYear()

planOfTheYear["January"]? [13] = ["Зробити домашню роботу"]

let february = planOfTheYear ["February"]

planOfTheYear["January"]? [13].insert("Прогулянка парком")
planOfTheYear["January"]? [14] = ["Зробити домашню роботу", "Залити домашню роботу на Github"]
printMonth(month: planOfTheYear ["January"]!)

//MARK: - 5. Структура Journal
struct MonthlyJornal {
    var plans: MonthlyPlan
    init (typicalDay: DailyPlan = [], numberOfDays: Int = 30) {
        plans = Array(repeating: typicalDay, count: numberOfDays)
    }
    func print() {
        printMonth(month: plans)
    }
    mutating func addPlan(_ plan: String, for day: Int) {
        plans[day].insert(plan)
    }
    func byAdding(_ plan: String, for day: Int) -> MonthlyJornal {
        var newJournal = MonthlyJornal()
        newJournal.plans = self.plans
        newJournal.addPlan(plan, for: day)
        return newJournal
    }
}


var jornal = MonthlyJornal()
jornal.print()
jornal.byAdding("Сходити в кіно", for: 5).print()


//MARK: - Протокол для подій
protocol DiaryEvent: Comparable {
    var nameEvent: [String] { get }
    var dateEvent: SimpleDate { get }
}
extension DiaryEvent {
    static func < (lhs: Self, rhs: Self) -> Bool {
        let sortedLhs = lhs.nameEvent.sorted()
        let sortedRhs = rhs.nameEvent.sorted()
        return sortedLhs.joined(separator: "") < sortedRhs.joined(separator: "")
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.nameEvent.sorted() == rhs.nameEvent.sorted()
    }
}

struct SimpleDate: CustomStringConvertible {
    var description: String {
        return "\(day) \(month)"
    }
    
    let month: String
    let day: Int
}

struct ListEvents: DiaryEvent {
    
    let nameEvent: [String]
    let dateEvent: SimpleDate
    
}


let feb10 = SimpleDate(month: "February", day: 10)
let feb15 = SimpleDate(month: "February", day: 15)

let listDevelopmentEvents = ListEvents(nameEvent: ["Go to GYM", "learn code", "read book"], dateEvent: feb10)
let listVacationEvents = ListEvents(nameEvent: ["Play PS5", "watching films", "active rest"], dateEvent: feb15)



func findEvent <E:DiaryEvent> (events: [E], date: SimpleDate){
    

    for event in events {
        let sortedEvents = event.nameEvent.sorted()
        print("On \(date) planned: \(sortedEvents.joined(separator: ", "))")
    }
}

findEvent(events: [listDevelopmentEvents], date: feb10)
findEvent(events: [listVacationEvents], date: feb15)

