// Func returns how many days in month
func getDaysInMonth(month: String) -> Int? {
    switch month {
    case "January", "March", "May", "July", "August", "October", "December":
        return 31
    case "April", "June", "September", "November":
        return 30
    case "February":
        return 28
    default:
        return 0
    }
}

// Структура Journal
struct Journal {
    var yearPlan: [String: [[String]]] = [:]
    
    init() {
        let months = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"]
        
        let defaultDayPlan: [String] = ["Drink coffee"]
        
        for month in months {
            if let days = getDaysInMonth(month: month) {
                yearPlan[month] = Array(repeating: defaultDayPlan, count: days)
            }
        }
    }
    
    // To get a plan for month
    func getMonthlyPlan(month: String) -> String {
        guard let monthlyPlans = yearPlan[month] else {
            return "Error: Incorrect month name!"
        }
        
        var output = ""
        for (index, dayPlan) in monthlyPlans.enumerated() {
            output += "\(index + 1) \(month): \(dayPlan.joined(separator: ", "))\n"
        }
        return output
    }
    
    // To add new event for day of month
    mutating func addEvent(toMonth month: String, day: Int, event: String) {
        guard var monthlyPlans = yearPlan[month], day > 0, day <= monthlyPlans.count else {
            print("Error: Invalid month or day")
            return
        }
        
        monthlyPlans[day - 1].append(event) // Додаємо подію до вказаного дня
        yearPlan[month] = monthlyPlans // Оновлюємо словник
    }
}
