//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
