//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
//    @State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}

