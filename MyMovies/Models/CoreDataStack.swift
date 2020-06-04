//
//  CoreDataStack.swift
//  MyMovies
//
//  Created by Iyin Raphael on 6/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    static let shared = CoreDataStack()
    
    var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyMovies")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        var error: Error?
        
        context.performAndWait {
            do {
                try context.save()
                context.automaticallyMergesChangesFromParent = true
            } catch let fetchError {
                error = fetchError
                NSLog("Error occured saving context to Core Data\(fetchError)")
            }
            
        }
        
        if let error = error { throw error }
    }
    
}
