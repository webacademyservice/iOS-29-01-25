import UIKit



//1 мій сет з планами на день
var dailyPlan:Set<String> = ["Сніданок",
                             "Зробити завдання",
                             "Робота"]

// 2 масив планів на місяць

//var monthlyPlan: [Set<String>] = Array(repeating: Set<String>(), count: 31)
//var monthlyPlan: Array<Set<String>> = Array(repeating: Set<String>(), count: 31)
var monthlyPlan = Array(repeating: dailyPlan, count: 31)

typealias DailyPlan = Set<String>
typealias MonthlyPlan = [DailyPlan]

func calendarForMonth (typicalDay: DailyPlan = [], numberOfDays: Int = 30) -> MonthlyPlan{
    
   return Array(repeating: typicalDay, count: numberOfDays)
   // .init(repeating: typicalDay, count: numberOfDays)
}

monthlyPlan[0] = dailyPlan
monthlyPlan[1] = ["Випити каву",
                  "Пограти в гру"]

// 3 Словник планів на рік
typealias YearPlan = [String: MonthlyPlan]

func calendarForYear (typicalDay: DailyPlan = []) -> YearPlan{
    
    let mothesOfTheYear = [
        "Січень" : 31,
        "Лютий" : 28,
        "Березень:" : 31
    ]
    
    //var yearPlan: YearPlan = [:]
    var yearPlan = YearPlan() // Подумати як зробити функцію "calendarForYear" без зміних і без цієї стрічки
   // var yearPlan: YearPlan = .init()
    for mothsIterator in mothesOfTheYear{
        yearPlan [mothsIterator.key] = calendarForMonth(typicalDay: typicalDay, numberOfDays: mothsIterator.value)
    }
    
    return yearPlan
}

// Вививодить по назві місяця кількість днів та плани на кожний день.
func printMonth (month: MonthlyPlan){
    var dayNumber = 1
    for day in month{
        print("\(dayNumber): \(day)")
        dayNumber += 1
    }
}

var planForOneMonth = calendarForMonth()

//printMonth(month: planForOneMonth)

planForOneMonth[4] = ["Випити каву",
                     "Пограти в гру"]
planForOneMonth[4].insert("Сходити в кіно")

//printMonth(month: planForOneMonth)

var planOfTheYear = calendarForYear()
//printMonth(month: planOfTheYear ["Лютий"]!)
//
//print(
//    (planOfTheYear ["Лютий"])? [13]
//)

planOfTheYear["Лютий"]? [13] = ["Випити каву",
                                "Пограти в гру"]

let feb = planOfTheYear ["Лютий"]!

planOfTheYear["Лютий"]? [13].insert("Сходити в кіно")
planOfTheYear["Лютий"]? [14] = ["Подивитися живе завдання", "Зробити ДЗ"]

//printMonth(month: planOfTheYear ["Лютий"]!)
//printMonth(month: feb)


struct MonthlyJornal{
    private var plans: MonthlyPlan
    
    init (typicalDay: DailyPlan = [], numberOfDays: Int = 30){
       plans = Array(repeating: typicalDay, count: numberOfDays)
    }
    
    func print(){
        printMonth(month: plans)
    }
    
    mutating func addPlan(_ plan: String, for day: Int){
        plans[day].insert(plan)
    }
    
    func byAdding (_ plan: String, for day: Int) -> MonthlyJornal{
       var newJournal = MonthlyJornal()
        newJournal.plans = self.plans
        newJournal.addPlan(plan, for: day)
        return newJournal
    }
}



let journal = MonthlyJornal()
//journal.addPlan("Сходити в кіно", for: 5)
//journal.print()

//journal.byAdding("Сходити в кіно", for: 5).print()

journal.print()







