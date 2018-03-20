//
//  TaskBuilder.swift
//  Nano3
//
//  Created by Felipe Melo on 2/10/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import Foundation

class TaskBuilder {
    // Static
    static let INDEX_NOT_FOUND = "Index not found on array"
    
    // Private
    private var tasks: [Task] = []
    
    func setup() {
        
    }
    
    func addTask(_ task: Task) {
        self.tasks.append(task)
    }
}

// getters and setters
extension TaskBuilder {
    // getters
    func getTask(_ index: Int) -> Task {
        assert(
            index >= 0 && index <= self.tasks.count - 1,
            TaskBuilder.INDEX_NOT_FOUND
        )
        
        return self.tasks[index]
    }
    
    func getTasks() -> [Task] {
        return self.tasks
    }
    
    func getTasksCount() -> Int {
        return self.tasks.count
    }
    
    // setters
    
}
