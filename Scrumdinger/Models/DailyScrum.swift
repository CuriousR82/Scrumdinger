//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import Foundation

struct DailyScrum: Identifiable {
    // To conform to Identifiable, a model must have a property named id. Your code won’t compile until you add this property.
    let id: UUID
        var title: String
        var attendees: [String]
        var lengthInMinutes: Int
        var theme: Theme
    
    // Add an initializer that assigns a default value to the id property.
    // When you define a default value for a parameter, you can omit that parameter when you call an initializer or function.
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
            self.id = id
            self.title = title
            self.attendees = attendees
            self.lengthInMinutes = lengthInMinutes
            self.theme = theme
        }
    }

extension DailyScrum {
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
        ]
    }
}
