//
//  CustomAnswerManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 25.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import CoreData

class CustomAnswerManager {
    
    let context: NSManagedObjectContext
    let userDefaultsManager: UserDefaultsManager
    var customAnswers: [CustomAnswer?] = []
    
    init(context: NSManagedObjectContext, defaultsManager: UserDefaultsManager) {
        self.context = context
        self.userDefaultsManager = defaultsManager
    }
    
    func saveAnswer(withText text: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "CustomAnswer", in: context) else { return }
        
        let textObject = CustomAnswer(entity: entity, insertInto: context)
        textObject.text = text
        
        do {
            try context.save()
            customAnswers.append(textObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteAnswer(_ selectedAnswer: CustomAnswer) {
        context.delete(selectedAnswer)
        
        do {
            try context.save()
            while customAnswers.contains(selectedAnswer) {
                if let answerToRemoveIndex = customAnswers.firstIndex(of: selectedAnswer) {
                    customAnswers.remove(at: answerToRemoveIndex)
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func loadDefaultAnswers() {
        let fetchRequest: NSFetchRequest<CustomAnswer> = CustomAnswer.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "text != nil")
        
        var records = 0
        
        do {
            records = try context.count(for: fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        if records == 0 {
            guard let entity = NSEntityDescription.entity(forEntityName: "CustomAnswer", in: context) else { return }
            
            let textObject = CustomAnswer(entity: entity, insertInto: context)
            
            for text in userDefaultsManager.defaultAnswersArray {
                textObject.text = text
                customAnswers.append(textObject)
            }
        }
    }
    
    func fetchAnswers() {
        let fetchRequest: NSFetchRequest<CustomAnswer> = CustomAnswer.fetchRequest()
        do {
            customAnswers = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
