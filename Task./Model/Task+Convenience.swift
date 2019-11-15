//
//  Task+Convenience.swift
//  Task.
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false) {
        self.init(context: CoreDataStack.context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
