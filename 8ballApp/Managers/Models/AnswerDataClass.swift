//
//  AnswerDataClass.swift
//  
//
//  Created by Sergey Dvornik on 25.11.2021.
//
//

import Foundation
import CoreData

@objc(Answer)
public class Answer: NSManagedObject {

}

extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?

}
