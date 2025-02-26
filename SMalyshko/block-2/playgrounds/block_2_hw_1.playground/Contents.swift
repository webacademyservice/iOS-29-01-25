import UIKit

typealias DailyPlans = Set<String>

var dailyPlans: DailyPlans = [
    "Сніданок",
    "Прогулянка в парку",
    "Дейлік",
    "Робота ч.1",
    "Обід",
    "Робота ч.2",
    "Вечеря",
    "Вебінар"
]

typealias MonthMap = Dictionary<String, Int>

func createMonthlyPlans(plans: DailyPlans = [], numOfDays: Int = 30) -> Array<DailyPlans> {
    return Array(repeating: plans, count: numOfDays)
}

typealias YearPlans = Dictionary<String, Array<DailyPlans>>

func createYearPlans(dailyPlans: DailyPlans = []) -> YearPlans {
    var monthMap: MonthMap  = [
        "Січень": 31,
        "Лютий": 28,
//        "Березень": 31,
//        "Квітень": 30,
//        "Травень": 31,
//        "Червень": 30,
    ]
    
    var yearPlan = YearPlans()
    
    
    for (key, value) in monthMap {
        yearPlan[key] = createMonthlyPlans(plans: dailyPlans, numOfDays: value)
    }
    
    return yearPlan
}

var yearPlans = createYearPlans()

func getMonthlyPlans(yearPlans: YearPlans, month: String) -> Array<DailyPlans> {
    guard let dailyPlans = yearPlans[month] else {
        print("Невірно вказаний місяць")
        return []
    }
    
    return dailyPlans
}

//let febPlans = getMonthlyPlans(yearPlans: yearPlans, month: "Лютий")

//print(febPlans)

struct Journal {
    var yearPlans: YearPlans
    
    func getMonthlyPlans(month: String) -> Array<DailyPlans> {
        guard let dailyPlans = self.yearPlans[month] else {
            print("Невірно вказаний місяць")
            return []
        }
        
        return dailyPlans
    }
    
    mutating func addPlan(_ plan: String, _ month: String, _ day: Int) {
        yearPlans[month]?[day].insert(plan)
    }
    
    func printMonthlyPlans(_ month: String) -> Array<DailyPlans> {
        guard let dailyPlans = self.yearPlans[month] else {
            print("Невірно вказаний місяць")
            return []
        }
        
        return dailyPlans
    }
}

var journal = Journal(yearPlans: yearPlans)
journal.addPlan("Сходити в кіно", "Лютий", 18)
journal.addPlan("Привітати сестру з Днем народження", "Лютий", 19)
print(journal.printMonthlyPlans("Лютий"))

struct JournalWithInit {
    private var yearPlans: YearPlans
    
    init() {
        self.yearPlans = createYearPlans()
    }
    
    func getMonthlyPlans(month: String) -> Array<DailyPlans> {
        guard let dailyPlans = self.yearPlans[month] else {
            print("Невірно вказаний місяць")
            return []
        }
        
        return dailyPlans
    }
    
    mutating func addPlan(_ plan: String, _ month: String, _ day: Int) {
        yearPlans[month]?[day].insert(plan)
    }
    
    func byAddingPlan(_ plan: String, _ month: String, _ day: Int) -> Self {
        var newJournal = JournalWithInit()
        newJournal.yearPlans = self.yearPlans
        newJournal.addPlan(plan, month, day)
        return newJournal
    }
}

var newJournalWithInit = JournalWithInit()
print(newJournalWithInit.byAddingPlan("Сходити в кіно", "Лютий", 1))

//yearPlans["Лютий"]?[15] = ["Зробити ДЗ"]
//yearPlans["Лютий"]?[16] = dailyPlans
//yearPlans["Лютий"]?[15].insert("Зустрітися з друзями")


