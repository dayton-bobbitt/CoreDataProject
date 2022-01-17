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
        
        return NSPredicate(format: "fullName CONTAINS[c] %@", filter)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Filter...", text: $filter)
                    .padding()
                    .disableAutocorrection(true)
                FilteredList(predicate: predicate) { (director: Director) in
                    Section(director.wrappedFullName) {
                        ForEach(director.movieArray) { movie in
                            Text(movie.wrappedTitle)
                        }
                    }
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
