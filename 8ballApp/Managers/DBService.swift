//
//  CoreDataStack.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 25.11.2021.
//
// swiftlint:disable trailing_whitespace unused_closure_parameter

import Foundation
import CoreData

class DBService {
    
    // MARK: CoreDataStack
    
    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext
    private lazy var backgroundContext: NSManagedObjectContext = persistentContainer.newBackgroundContext()
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AnswersDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var entityName = "ManagedAnswer"
    private var answers: [ManagedAnswer] = []
    
    // MARK: CoreData Saving support
    
    private func getObjects<T: NSManagedObject>(_ request: NSFetchRequest<T>,
                                                completion: @escaping (Result<[T], Error>) -> Void) {
        let context = context
        context.perform {
            do {
                let result = try context.fetch(request)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    private func saveBackgroundContext (_ backgroundContext: NSManagedObjectContext) {
        if backgroundContext.hasChanges {
            do {
                try backgroundContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Public functions
    
    public func fetchAnswers(isLocal: Bool) -> [Answer] {
        let fetchRequest: NSFetchRequest<ManagedAnswer> = ManagedAnswer.fetchRequest()
        getObjects(fetchRequest) { result in
            switch result {
            case .success(let answers):
                self.answers = answers
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return answers.self.map { $0.toAnswer() }
    }

    public func saveAnswers(answers: [Answer]) {
        backgroundContext.perform {
            for answer in answers {
                let dbAnswer = ManagedAnswer(context: self.backgroundContext)
                dbAnswer.text = answer.text
                dbAnswer.isLocal = answer.isLocal
                dbAnswer.date = answer.date
                self.answers.append(dbAnswer)
            }
            self.saveBackgroundContext(self.backgroundContext)
        }
    }
}
