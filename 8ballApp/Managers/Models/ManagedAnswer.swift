//
//  ManagedAnswer.swift
//  
//
//  Created by Sergey Dvornik on 29.11.2021.
//
//

import Foundation
import CoreData

@objc(ManagedAnswer)
public class ManagedAnswer: NSManagedObject {

}

extension ManagedAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedAnswer> {
        return NSFetchRequest<ManagedAnswer>(entityName: "ManagedAnswer")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var isLocal: Bool
}

extension ManagedAnswer {
    func toAnswer() -> Answer {
        let answer = Answer(text: self.text!, date: self.date!, isLocal: self.isLocal)
        return answer
    }
}
