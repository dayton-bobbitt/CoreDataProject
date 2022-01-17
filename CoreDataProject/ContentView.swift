//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var filter = ""
    @State private var addMovieIsPresented = false
    
    private var predicate: NSPredicate? {
        guard !filter.isEmpty else {
            return nil
        }
        
        let titleFilter = NSPredicate(format: "title CONTAINS[c] %@", filter)
        let directorFilter = NSPredicate(format: "director CONTAINS[c] %@", filter)
        
        return NSCompoundPredicate(orPredicateWithSubpredicates: [
            titleFilter,
            directorFilter
        ])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Filter...", text: $filter)
                    .padding()
                    .disableAutocorrection(true)
                FilteredList(predicate: predicate) { (movie: Movie) in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(movie.wrappedTitle)
                            .font(.headline)
                        Text(movie.wrappedDirector)
                            .font(.subheadline)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Favorite movies")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        addMovieIsPresented = true
                    } label: {
                        Label("Add movie", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $addMovieIsPresented) {
                AddMovieView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
