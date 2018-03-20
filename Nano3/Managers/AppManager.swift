//
//  AppManager.swift
//  Nano3
//
//  Created by Felipe Melo on 2/10/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import Foundation

class AppManager {
    
    // Static
    static let instance: AppManager = AppManager()
    
    // Private
    private var taskBuilder: TaskBuilder = TaskBuilder()
    private var testBuilder: TestBuilder = TestBuilder()
    
    
    private init() {
        taskBuilder.setup()
    }
    
    func addTask(_ task: Task) {
        self.taskBuilder.addTask(task)
    }
}

// getters and setters
extension AppManager {
    func getTask(index: Int) -> Task {
        return self.taskBuilder.getTask(index)
    }
    
    func getTasks() -> [Task] {
        return self.taskBuilder.getTasks()
    }
    
    func getTasksCount() -> Int {
        return self.taskBuilder.getTasksCount()
    }
    
    func getTest() -> Test {
        return self.testBuilder.getTest()
    }
}
