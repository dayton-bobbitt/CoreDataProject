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
    
    @State private var title = ""
    @State private var director = ""
    @State private var saveError = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Director", text: $director)
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
        !(title.isEmpty || director.isEmpty)
    }
    
    private func saveMovie() {
        let movie = Movie(context: moc)
        
        movie.title = title
        movie.director = director
        
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
