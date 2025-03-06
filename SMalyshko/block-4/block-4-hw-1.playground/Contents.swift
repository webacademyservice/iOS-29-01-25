import UIKit

typealias DailyPlans = Array<String>

typealias MonthMap = Dictionary<String, Int>

typealias YearPlans = Dictionary<String, Array<DailyPlans>>

var monthMap: MonthMap  = [
    "Січень": 31,
    "Лютий": 28,
    "Березень": 31,
    "Квітень": 30,
    "Травень": 31,
    "Червень": 30,
]


class Year {
    private var monthMap: MonthMap
    var yearPlans: YearPlans = [:]
    
    init(monthMap: MonthMap) {
        self.monthMap = monthMap
    }
    
    private func createMonthlyPlans(dailyPlans: DailyPlans = [], numberOfDays: Int) -> Array<DailyPlans>  {
        return Array(repeating: dailyPlans, count: numberOfDays)
    }
    
    func createYearPlans(dailtyPlans: DailyPlans = []) {
        for (key, value) in self.monthMap {
            yearPlans[key] = self.createMonthlyPlans(dailyPlans: dailtyPlans, numberOfDays: value)
        }
    }
    
    func getYearPlans() -> YearPlans {
        return self.yearPlans
    }
}

let year = Year(monthMap: monthMap)
year.createYearPlans()

let yearPlans = year.getYearPlans()

class Journal {
    var journalYearPlans: YearPlans = [:]
    
    init(journalYearPlans: YearPlans) {
        self.journalYearPlans = journalYearPlans
    }
    
    func addPlan(month: String, day: Int, plan: String) {
        journalYearPlans[month]?[day - 1].append(plan)
    }
    
    func getDailyPlans(month: String, day: Int) -> DailyPlans {
        guard let plansForMonth = journalYearPlans[month] else {
            return ["Невірно вказаний місяць"]
        }
        
        guard day > 0 && day <= plansForMonth.count else {
            return ["Невірно вказаний день"]
        }
        
        let dailyPlans = plansForMonth[day - 1]
        
        if dailyPlans.isEmpty {
            return ["Немає запланованих дій на цей день"]
        }
        
        return dailyPlans
    }
}

let journal = Journal(journalYearPlans: yearPlans)
journal.addPlan(month: "Березень", day: 1, plan: "Зробити д.з. 1 блок 4")
journal.addPlan(month: "Березень", day: 1, plan: "Зробити д.з. 2 блок 4")
print(journal.getDailyPlans(month:"Березень", day: 1))
