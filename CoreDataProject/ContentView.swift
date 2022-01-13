//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var movies: FetchedResults<Movie>
    @State private var addMovieIsPresented = false
    
    var body: some View {
        NavigationView {
            List(movies) { movie in
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.wrappedTitle)
                        .font(.headline)
                    Text(movie.wrappedDirector)
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
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
