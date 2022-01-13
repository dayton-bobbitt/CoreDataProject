//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/12/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    
    public var wrappedTitle: String {
        guard let title = title else {
            fatalError("Unexpected null value 'title'")
        }

        return title
    }
    
    public var wrappedDirector: String {
        guard let director = director else {
            fatalError("Unexpected null value 'director'")
        }

        return director
    }

}

extension Movie : Identifiable {

}
