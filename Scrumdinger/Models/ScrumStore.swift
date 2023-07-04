//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-07-03.
//

import Foundation

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    // retrieving the URL of a specific directory (the user's documents directory), and then appending a path component "scrums.data" to that URL. The resulting URL represents the complete file path to a file named "scrums.data" within the documents directory.
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        // The parameters in <> tell the compiler that your closure returns [DailyScrum] and can throw an Error.
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            // the guard statement is used to check if the data can be retrieved from the file specified by the fileURL. If the data cannot be retrieved, the guard statement's else block is executed, and an empty array [] is returned as a fallback value.
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            // If no errors occur and the guard condition is satisfied, the let dailyScrums = try JSONDecoder().decode(...) line is executed, attempting to decode the data into an array of DailyScrum objects.
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        // this line attempts to retrieve the result of the task.
        // If an error occurs during the task execution, it will be propagated and can be caught by the caller of the load() function.
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
