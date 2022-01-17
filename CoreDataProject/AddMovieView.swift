//
//  AddMovieView.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @State private var movieTitle = ""
    @State private var directorFullName = ""
    @State private var saveError = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $movieTitle)
                TextField("Director", text: $directorFullName)
            }
            .navigationTitle("Add a new movie")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action: saveMovie) {
                        Text("Save")
                    }
                    .disabled(!isValidMovie)
                }
            }
            .alert(isPresented: $saveError) {
                Alert(
                    title: Text("Something went wrong"),
                    message: Text("We were unable to save the movie. Please try again later."),
                    dismissButton: .default(Text("OK"), action: {
                        saveError = false
                    })
                )
            }
        }
    }
    
    private var isValidMovie: Bool {
        !(movieTitle.isEmpty || directorFullName.isEmpty)
    }
    
    private func saveMovie() {
        let movie = Movie(context: moc)
        let director = Director(context: moc)
        
        movie.title = movieTitle
        movie.director = director
        movie.director?.fullName = directorFullName
        
        do {
            try moc.save()
            dismiss()
        } catch {
            print("Failed to save new movie: \(error.localizedDescription)")
            saveError = true
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
