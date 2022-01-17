//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/17/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: Director?

}

extension Movie : Identifiable {

}

extension Movie {
    public var wrappedTitle: String {
        guard let title = title else {
            fatalError("Unexpected null value 'title'")
        }

        return title
    }
    
    public var wrappedDirector: Director {
        guard let director = director else {
            fatalError("Unexpected null value 'director'")
        }

        return director
    }
}
