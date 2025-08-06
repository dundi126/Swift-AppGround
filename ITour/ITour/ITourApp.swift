//
//  ITourApp.swift
//  ITour
//
//  Created by Dundi vignesh Gutti on 8/6/25.
//

import SwiftUI
import SwiftData

@main
struct ITourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
