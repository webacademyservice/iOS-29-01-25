import SwiftUI

protocol Event: Comparable {
    var nameEvent: [String] { get }
    var dateEvent: SimpleDate { get }
}

class SimpleDate: CustomStringConvertible {
    
    let month: String
    let day: Int
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    
    var description: String {
        return "\(day)"
    }
}

class ListEvents: Event, Identifiable {
    
    let nameEvent: [String]
    let dateEvent: SimpleDate
    
    init(nameEvent: [String], dateEvent: SimpleDate) {
        self.nameEvent = nameEvent
        self.dateEvent = dateEvent
    }
    
    var id: String {
        return dateEvent.description + nameEvent.joined()
    }
    
}

let mar1 = SimpleDate(month: "Березень", day: 1)
let mar3 = SimpleDate(month: "Березень", day: 3)
let apr4 = SimpleDate(month: "Квітень", day: 4)
let apr6 = SimpleDate(month: "Квітень", day: 6)
let apr10 = SimpleDate(month: "Квітень", day: 10)
let may5 = SimpleDate(month: "Травень", day: 5)
let may22 = SimpleDate(month: "Травень", day: 22)


let marListWorkout2 = ListEvents(nameEvent: ["Плавання", "Велосипед", "Біг"], dateEvent: mar1)
let marListEventsDay = ListEvents(nameEvent: ["Спортивний зал", "День народження"], dateEvent: mar3)

let aprListWorkout1 = ListEvents(nameEvent: ["Віджимання","Біг на вулиці","Штанга","Гребля"], dateEvent: apr4)
let aprListEventDay = ListEvents(nameEvent: ["Кава","Перукарня","Кіно","Вечірка"], dateEvent: apr6)
let aprListEducation = ListEvents(nameEvent: ["Структури в Swift","Swift UI","Класи","Мережі"], dateEvent: apr10)

let mayListWorkout1 = ListEvents(nameEvent: ["Футбол","Відновлення"], dateEvent: may5)
let mayListEventDay = ListEvents(nameEvent: ["Похід в гори","Вечір з друзями"], dateEvent: may22)



struct ContentView: View {
    
    @State var query: String = ""
    
    let eventsMar: [ListEvents] = [marListWorkout2, marListEventsDay]
    let eventsApr: [ListEvents] = [aprListWorkout1, aprListEventDay, aprListEducation]
    let eventsMay: [ListEvents] = [mayListWorkout1,mayListEventDay]
    
    
    var body: some View {
        
        Text ("Розклад")
            .font(.title)
            .fontWeight(.bold)
        
        VStack(alignment: .leading){
            HStack {
                TextField("Введіть назву місяця", text: $query)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            
        }

        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
        
        
        List  {
            if query.isEmpty || "Березень".lowercased().contains(query.lowercased()) {
                Section(header: Text("\(mar1.month)")) {
                    ForEach(eventsMar) { event in
                        HStack {
                            Text("Число: \(event.dateEvent.description) - ")
                                .font(.subheadline)
                            Text("\(event.nameEvent.sorted().joined(separator: ", "))")
                        }
                    }
                }
            }
            
            if query.isEmpty || "Квітень".lowercased().contains(query.lowercased()) {
                Section(header: Text("\(apr4.month)")) {
                    ForEach(eventsApr) { event in
                        HStack {
                            Text("Число: \(event.dateEvent.description) - ")
                                .font(.subheadline)
                            Text("\(event.nameEvent.sorted().joined(separator: ", "))")
                        }
                    }
                }
            }
            
            if query.isEmpty || "Травень".lowercased().contains(query.lowercased()) {
                Section(header: Text("\(may5.month)")) {
                    ForEach(eventsMay) { event in
                        HStack {
                            Text("Число: \(event.dateEvent.description) - ")
                                .font(.subheadline)
                            Text("\(event.nameEvent.sorted().joined(separator: ", "))")
                        }
                    }
                }
            }
            
        }
    }
}

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

#Preview {
    ContentView()
}
