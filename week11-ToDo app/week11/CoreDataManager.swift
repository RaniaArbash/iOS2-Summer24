//
//  CoreDataManager.swift
//  week11
//
//  Created by Rania Arbash on 2024-07-18.
//

import Foundation
import CoreData

// MARK: - Core Data stack

class CoreDataManager {
    
   static var shared = CoreDataManager()
    
    func addNewToDo(t : String, isUrgent: Bool){
       var newToDo = ToDo(context: persistentContainer.viewContext)
        newToDo.task = t
        newToDo.isUrgent = isUrgent
        
        saveContext()
        
    }
    
    func deleteOneToDo(tobeDeleted : ToDo){
        persistentContainer.viewContext.delete(tobeDeleted)
        saveContext()
        
    }
    func updateToDo(tobeupdatedToDo : ToDo, newtask : String){
        tobeupdatedToDo.task = newtask
        saveContext()
        
    }
    
    func getToDo(text: String)-> [ToDo] {
        // select * from ToDo
        var result = [ToDo]()
        let fetchRequest : NSFetchRequest<ToDo> = ToDo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "task BEGINSWITH [c] %@", text)

        do{
           result  = try persistentContainer.viewContext.fetch(fetchRequest)
        }catch {
            print (error)
        }
        return result
    }
    
    func getAllToDos()-> [ToDo] {
        // select * from ToDo
        var result = [ToDo]()
        let fetchRequest : NSFetchRequest<ToDo> = ToDo.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "task", ascending: true)]
        do{
           result  = try persistentContainer.viewContext.fetch(fetchRequest)
        }catch {
            print (error)
        }
        return result
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "week11")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
