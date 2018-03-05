//
//  CoreDataManager.swift
//  CoreData with Multiple Relation Ships
//
//  Created by Mohd Imran on 2/20/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static let sharedInstance = CoreDataManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreData_with_Multiple_Relation_Ships")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
    
    func addArticle(withArticle article:[String:Any]) -> Bool {
        
        guard  let entityDesc = NSEntityDescription.entity(forEntityName: "Article", in: persistentContainer.viewContext) else {
            return false
        }
        
        guard  let title = article["title"] as? [String:Any], let eng_title = title["en"] as? String else {
            return false
        }
        
        let objArticle = NSManagedObject(entity: entityDesc, insertInto: persistentContainer.viewContext)
        objArticle.setValue(eng_title, forKey: "title")
        objArticle.setValue(eng_title, forKey: "id")
        
        if let dateString = article["publish_date"] as? String{
         
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            objArticle.setValue(formatter.date(from: dateString), forKey: "published_date")
        }
        
        var topicArray:[[String:Any]] = []
        if let value = article["topics"] as? [[String:Any]]{
            topicArray = value
        }
        
        var annotationArray:[[String:Any]] = []
        if let value = article["annotations"] as? [[String:Any]]{
            annotationArray = value
        }
        
        guard  let publication = article["publication"] as? [String:Any] else {
            
            let _ = saveAnnotation(withArticle: objArticle, withAnnotationArray: annotationArray)
            let _ = saveTopic(withArticle: objArticle, withTopicArray: topicArray)
            saveContext()
            return false
        }
        
        guard let name = publication["name"] as? [String:Any] else {
            
            let _ = saveAnnotation(withArticle: objArticle, withAnnotationArray: annotationArray)
            let _ = saveTopic(withArticle: objArticle, withTopicArray: topicArray)
            saveContext()
            return false
        }
        
        guard let eng_name = name["en"] as? String else {
            
            let _ = saveAnnotation(withArticle: objArticle, withAnnotationArray: annotationArray)
            let _ = saveTopic(withArticle: objArticle, withTopicArray: topicArray)
            saveContext()
            return false
        }
        
        objArticle.setValue(eng_name, forKey: "publication")
        objArticle.setValue(article["original_lang"] as? String  ?? "", forKey: "original_lang")
        
        guard  let description = article["description"] as? [String:Any], let desc_en = description["en"] as? String else {
            
            let _ = saveAnnotation(withArticle: objArticle, withAnnotationArray: annotationArray)
            let _ = saveTopic(withArticle: objArticle, withTopicArray: topicArray)
            saveContext()
            return false
        }
        
        objArticle.setValue(desc_en, forKey: "desc")
        objArticle.setValue(article["author"] as? String ?? "", forKey: "author")
        
        let _ = saveAnnotation(withArticle: objArticle, withAnnotationArray: annotationArray)
        let _ = saveTopic(withArticle: objArticle, withTopicArray: topicArray)
        saveContext()
        
        return true
    }
    
    func saveTopic(withArticle articleObject:NSManagedObject, withTopicArray topicArray:[[String:Any]]) -> Bool {
        
        guard  let objectArticle = articleObject as? Article else {
            return false
        }
        
        guard let topics = NSEntityDescription.entity(forEntityName: "Topic", in: persistentContainer.viewContext) else {
            return false
        }
        
        let topic_mapping = objectArticle.mutableSetValue(forKey: "topic_mapping")
        
        for obj in topicArray {
            
            let objTopic = NSManagedObject(entity: topics, insertInto: persistentContainer.viewContext)
            objTopic.setValue(obj["id"] as? String ?? "", forKey: "id")
            if let name = obj["name"] as? [String:Any]{
                
                if let eng = name["en"] as? String{
                    
                    objTopic.setValue(eng, forKey: "title")
                    
                }
                
            }
            
            topic_mapping.add(objTopic)
        }
        
        return true
        
    }
    
    func getContext() -> NSManagedObjectContext? {
        
        return persistentContainer.viewContext
    }
    
    func getAnnotationEntity() -> NSEntityDescription? {
        
        guard let annotation = NSEntityDescription.entity(forEntityName: "Annotation", in: persistentContainer.viewContext) else {
            return nil
        }
        
        return annotation
    }
    
    func saveAnnotation(withArticle articleObject:NSManagedObject, withAnnotationArray annotationArray:[[String:Any]]) -> Bool {
        
        guard  let objectArticle = articleObject as? Article else {
            return false
        }
        
        guard let annotation = NSEntityDescription.entity(forEntityName: "Annotation", in: persistentContainer.viewContext) else {
            return false
        }
        
        let annotation_mapping = objectArticle.mutableSetValue(forKey: "annotation_mapping")
        
        for obj in annotationArray {
            
            let objAnnotation = NSManagedObject(entity: annotation, insertInto: persistentContainer.viewContext)
            objAnnotation.setValue(obj["annotation_id"] as? String ?? "", forKey: "id")
            objAnnotation.setValue(obj["language"] as? String ?? "", forKey: "language")
            objAnnotation.setValue(obj["path"] as? String ?? "", forKey: "path")
            
            if let dateString = obj["created_at"] as? String{
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                objAnnotation.setValue(formatter.date(from: dateString), forKey: "date")
            }
            objAnnotation.setValue(obj["position"] as? String ?? "", forKey: "position")
            objAnnotation.setValue(obj["text"] as? String ?? "", forKey: "text")
            objAnnotation.setValue(obj["text_range"] as? String ?? "", forKey: "text_range")
            objAnnotation.setValue(obj["method"] as? String ?? "", forKey: "type")
            
            annotation_mapping.add(objAnnotation)
        }
        
        return true
    }
    
    func getArticles() -> Void {
        
        let fetchRequestResult = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        if let arrData = try? persistentContainer.viewContext.fetch(fetchRequestResult) as? [Article], let value = arrData{
            
            for objArticle in value{
                
                if let topic_mapping = objArticle.topic_mapping, topic_mapping.count > 0{
                    
                    for obj in topic_mapping{
                        
                        if let topic = obj as? Topic{
                            
                        }
                    }
                }
                
                if let annotation_mapping = objArticle.annotation_mapping, annotation_mapping.count > 0{
                    
                    for obj in annotation_mapping{
                        
                        if let annotation = obj as? Annotation{
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    func saveData(withVaue value:Bool) -> Bool {
        
        return !value
    }
    
    func checkPublicationData(withArticle article:[String:Any]) -> Bool {
        
        guard  let publication = article["publication"] as? [String:Any] else {
            
            return false
        }
        
        guard let name = publication["name"] as? [String:Any] else {
            
            return false
        }
        
        guard let _ = name["en"] as? String else {
            
            return false
        }
        
        return true
    }
}
