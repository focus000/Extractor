//
//  ExtractorApp.swift
//  Extractor
//
//  Created by Yunfang Li on 2/13/23.
//

import SwiftUI

@main
struct ExtractorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            InputsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
