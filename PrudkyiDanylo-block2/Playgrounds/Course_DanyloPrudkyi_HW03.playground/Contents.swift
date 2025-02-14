import Foundation

//MARK: - 1. Створення Set для плану на день
var dailyPlan: Set<String> = ["Прокинутись", "Поснідати", "Піти на роботу", "Сходити в спортазал, Зробити домашнє завдання"]

//MARK: - 2. Масив планів на місяць
//monthlyPlan[0] = ["Зустріч з другом", "Купити продукти"]
//monthlyPlan[1] = ["Зробити домашнє завдання", "Подивитися фільм"]
var monthlyPlan = Array(repeating: dailyPlan, count: 30)

typealias DailyPlan = Set<String>
typealias MonthlyPlan = [DailyPlan]

func calendarForMonth (typicalDay: DailyPlan = [], numberOfDays: Int = 30) -> [DailyPlan] {
    
    //return Array(repeating: typicalDay, count: numberOfDays)
    // Строка 16 = строчці 18 (єдинтичні)
    .init(repeating: typicalDay, count: numberOfDays)
}

//MARK: - 3. Словник планів на рік
typealias YearPlan = [String: MonthlyPlan]

func calendarForYear(typicalDay: DailyPlan = []) -> YearPlan {
    let mothesOfTheYear = ["January": 31, "February": 28, "March": 31]
    var yearPlan = YearPlan() // попробывать сделать функцию без этой строчки( без var )
    //var yearPlan: YearPlan = [:]
    //var yearPlan: YearPlan = .init
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
//printMonth(month: planForOneMonth)
planForOneMonth[4] = ["Зробити домашню роботу"]
planForOneMonth[4].insert("сходити в кіно")
//printMonth(month: planForOneMonth)
//

var planOfTheYear = calendarForYear()
//printMonth(month: planOfTheYear ["January"]!)

//print((planOfTheYear["January"])? [4])

planOfTheYear["January"]? [13] = ["Зробити домашню роботу"]

let february = planOfTheYear ["February"]

planOfTheYear["January"]? [13].insert("Прогулянка парком")
planOfTheYear["January"]? [14] = ["Зробити домашню роботу", "Залити домашню роботу на Github"]
printMonth(month: planOfTheYear ["January"]!)

// 5. Структура Journal
//Зробити таку саму структуру тільки про рік
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
