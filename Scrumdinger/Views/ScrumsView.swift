//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                // The destination presents a single view in the navigation hierarchy when a user interacts with the element. Each row pushes to an individual destination. The Text view acts as a placeholder until you create the detail screen.
                // takes you to another view, then CardView interacts with the user.
                // NavigationLink(destination: Text(scrum.title)) {
                // In ScrumsView.swift, update the NavigationLink to set DetailView as the new destination.
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
