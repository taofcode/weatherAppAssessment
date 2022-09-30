//
//  CoreDataManager.swift
//  Assessment
//
//  Created by shelton chiuswa on 29/9/2022.
//

import Foundation

import CoreData



class CoreDataManger: ObservableObject{
    
    let persistantContaner: NSPersistentContainer
    
    init() {
        persistantContaner = NSPersistentContainer(name: "AssessmentDataModel")
        persistantContaner.loadPersistentStores{(description, error) in
            if let error = error {
                fatalError("Core Data Failed \(error.localizedDescription)")
            }
            
        }
        
    }
    func getAllPlaces()->[Places]{
        let fetchRequest: NSFetchRequest<Places> = Places.fetchRequest()
        do{
          return try  persistantContaner.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
        
    }
    func save(name: String, latitude: Double, longitude: Double){
        
        let place = Places(context:persistantContaner.viewContext)
        place.name = name
        place.latitude = latitude
        place.longitude = longitude
        do{
            try persistantContaner.viewContext.save()
        }catch{
            print("Failed to save record \(error)")
        }
    }
    
    func delete(place: Places) {
        persistantContaner.viewContext.delete(place)
        do{
            try persistantContaner.viewContext.save()
            
            
            
        }catch{
            persistantContaner.viewContext.rollback()
            print("Failed to delete place \(error) we now rolling back")
        }
    }
    
    
    
}
