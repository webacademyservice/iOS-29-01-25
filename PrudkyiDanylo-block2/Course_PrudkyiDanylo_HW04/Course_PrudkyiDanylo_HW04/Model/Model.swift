//
//  Model.swift
//  Course_PrudkyiDanylo_HW04
//
//  Created by Danylo Prudkyi on 24.02.2025.
//

import Foundation

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
        return "\(day)"
    }
    
    let month: String
    let day: Int
}

struct ListEvents: DiaryEvent, Identifiable {
    
    let nameEvent: [String]
    let dateEvent: SimpleDate
    
    var id: String {
        return dateEvent.description + nameEvent.joined()
    }
}

