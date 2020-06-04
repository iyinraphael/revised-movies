//
//  Movie+Convinience.swift
//  MyMovies
//
//  Created by Iyin Raphael on 6/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
    
    var movieRep: MovieRepresentation? {
        
        guard let identifier = identifier?.uuidString, let title = title else { return nil }
        
        return MovieRepresentation(title: title, identifier: identifier, hasWatched: hasWatched)
    }
    
    @discardableResult convenience init(title: String,
                                         identifier: UUID = UUID(),
                                         hasWatched: Bool = false,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.identifier = identifier
        self.hasWatched = hasWatched
    }
    
    convenience init?(movieRep: MovieRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        guard let identifier = UUID(uuidString: movieRep.identifier) else { return nil }
        
        self.init(title: movieRep.title, identifier: identifier, hasWatched: movieRep.hasWatched, context: context)
    }
}
