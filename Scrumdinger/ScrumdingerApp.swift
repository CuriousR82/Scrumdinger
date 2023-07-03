//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}

