//
//  Destination.swift
//  ITour
//
//  Created by Dundi vignesh Gutti on 8/6/25.
//

import Foundation
import SwiftData

@Model
class Destination{
    var name: String
    var details: String
    var priority: Int
    var date : Date
    
    init(name: String = "", details: String = "", priority: Int = 1, date : Date = .now) {
        self.name = name
        self.details = details
        self.priority = priority
        self.date = date
    }
}
