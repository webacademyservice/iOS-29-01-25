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
struct SimpleEvent: Event {
    static func < (lhs: SimpleEvent, rhs: SimpleEvent) -> Bool {
        lhs.name < rhs.name
    }
    
    let name: String
}

// Структура Journal
struct Journal {
    var yearPlan: [String: [[any Event]]] = [:]
    
    init() {
        let months = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"]
        
        let defaultDayPlan: [any Event] = ["Play guitar", "Read a book","Drink coffee", "Approve a code"].map{ myStr in
            return SimpleEvent(name: myStr)
        }
        
        for month in months {
            if let days = getDaysInMonth(month: month) {
                yearPlan[month] = Array(repeating: defaultDayPlan, count: days)
            }
        }
    }
    
    // To get a plan for month
    func getMonthlyPlan(month: String) -> String {
        guard let eventsForMonth = yearPlan[month] else {
            return "Error: Incorrect month name!"
        }
        let monthlyPlan = eventsForMonth.map {eventsForDay in
            eventsForDay.map{
                event in return event.name
            }
        }
        var output = ""
        for (index, dayPlan) in monthlyPlan.enumerated() {
            output += "\(index + 1) \(month): \(dayPlan.joined(separator: ", "))\n"
        }
        return output
    }
    
    // New function to get events as ListEvents objects
    func getEventsForMonth(month: String) -> [[any Event]] {
        guard let eventsForMonth = yearPlan[month] else {
            return []
        }
        let arrangeEvents = eventsForMonth.map {eventsForDay in
            return eventsForDay.sorted { leftEvent, rightEvent -> Bool in
                leftEvent.name < rightEvent.name
            }
        }
        return arrangeEvents
    }
    
    // To add new event for day of month
    mutating func addEvent(toMonth month: String, day: Int, event: any Event) {
        guard var monthlyPlans = yearPlan[month], day > 0, day <= monthlyPlans.count else {
            print("Error: Invalid month or day")
            return
        }
        
        monthlyPlans[day - 1].append(event) // Додаємо подію до вказаного дня
        yearPlan[month] = monthlyPlans // Оновлюємо словник
    }
}
