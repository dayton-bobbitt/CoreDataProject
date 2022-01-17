//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/17/22.
//

import CoreData
import SwiftUI

struct FilteredList<Content: View, T: NSManagedObject>: View {
    @FetchRequest private var fetchRequest: FetchedResults<T>
    private var rowContent: (T) -> Content
    
    init(predicate: NSPredicate?, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: predicate)
        self.rowContent = content
    }
    
    var body: some View {
        List(fetchRequest, id: \.self, rowContent: self.rowContent)
    }
}
