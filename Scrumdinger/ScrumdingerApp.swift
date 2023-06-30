//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}

