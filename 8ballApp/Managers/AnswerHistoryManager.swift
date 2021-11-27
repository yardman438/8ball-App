//
//  AnswerHistoryManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 25.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import CoreData

class AnswerHistoryManager {
    let context: NSManagedObjectContext
    var answers: [Answer?] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveAnswer(withText text: String?, date: Date?) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Answer", in: context) else { return }

        let textObject = Answer(entity: entity, insertInto: context)
        textObject.text = text
        textObject.date = date

        do {
            try context.save()
            answers.append(textObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteAnswer(_ selectedAnswer: Answer) {
        context.delete(selectedAnswer)

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchAnswers() -> [Answer?] {
        let fetchRequest: NSFetchRequest<Answer> = Answer.fetchRequest()
            do {
                answers = try context.fetch(fetchRequest)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        return answers
     }
}
