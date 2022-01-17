//
//  Director+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dayton Bobbitt on 1/17/22.
//
//

import Foundation
import CoreData


extension Director {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Director> {
        return NSFetchRequest<Director>(entityName: "Director")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var movie: NSSet?

}

// MARK: Generated accessors for movie
extension Director {

    @objc(addMovieObject:)
    @NSManaged public func addToMovie(_ value: Movie)

    @objc(removeMovieObject:)
    @NSManaged public func removeFromMovie(_ value: Movie)

    @objc(addMovie:)
    @NSManaged public func addToMovie(_ values: NSSet)

    @objc(removeMovie:)
    @NSManaged public func removeFromMovie(_ values: NSSet)

}

extension Director : Identifiable {

}

extension Director {
    public var wrappedFullName: String {
        guard let fullName = fullName else {
            fatalError("Unexpected null value 'fullName'")
        }

        return fullName
    }
    
    public var movieArray: [Movie] {
        let set = movie as? Set<Movie> ?? []
        
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }
}
