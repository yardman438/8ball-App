//
//  DBAnswerData.swift
//  
//
//  Created by Sergey Dvornik on 29.11.2021.
//
//

import Foundation
import CoreData

@objc(DBAnswer)
public class DBAnswer: NSManagedObject {

}

extension DBAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBAnswer> {
        return NSFetchRequest<DBAnswer>(entityName: "DBAnswer")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var isLocal: Bool
}

extension DBAnswer {
    func toManagedAnswer() -> ManagedAnswer {
        let managedAnswer = ManagedAnswer(text: self.text!, date: self.date!, isLocal: self.isLocal)
        return managedAnswer
    }
}
