//
//  DataController.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { _description, error in
            if let error = error {
                fatalError("Failed to load persistent store: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.rollback
        }
    }
}
