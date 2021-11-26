//
//  CustomAnswerDataClass.swift
//  
//
//  Created by Sergey Dvornik on 25.11.2021.
//
//

import Foundation
import CoreData

@objc(CustomAnswer)
public class CustomAnswer: NSManagedObject {

}

extension CustomAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomAnswer> {
        return NSFetchRequest<CustomAnswer>(entityName: "CustomAnswer")
    }

    @NSManaged public var text: String?

}
