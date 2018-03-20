//
//  Task.swift
//  Nano3
//
//  Created by Felipe Melo on 2/9/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

typealias WeekDay = [String: Bool]

enum TaskType: String {
    case NONE = "none"
    case EVERY_DAY = "Every Day"
    case EVERY_WEEK = "Every Week"
    case EVERY_MONTH = "Every Month"
}

class Task {
    
    // Private
    private var taskImage: UIImage?
    private var taskName: String = "Name"
    private var taskType: TaskType!
    private var days: WeekDay!
    private var multiple: Bool!
    private var taskOptions: [TaskOption]!
    
    private var newTaskOptions: [TaskOption] = [
        TaskOptions.MORNING,
        ]
    private var newTaskMultipleOptions: [TaskOption] = [
        TaskOptions.MORNING,
        TaskOptions.AFTERNOON,
        TaskOptions.NIGHT
    ]
    
    init() {
        self.taskType = .NONE
        self.multiple = false
        self.taskOptions = [TaskOption]()
        
        self.initDays()
    }
    
    convenience init(name: String, image: UIImage) {
        self.init()
        
        self.taskImage = image
        self.taskName = name
    }
    
    init(type: TaskType, multiple: Bool) {
        self.taskType = type
        self.multiple = multiple
        self.taskOptions = [TaskOption]()
        
        self.initDays()
    }
    
    init(type: TaskType, multiple: Bool, options: [TaskOption]) {
        self.taskType = type
        self.multiple = multiple
        self.taskOptions = options
        
        self.initDays()
    }
    
    init(name: String, image: UIImage, type: TaskType, multiple: Bool, options: [TaskOption]) {
        self.taskImage = image
        self.taskName = name
        
        self.taskType = type
        self.multiple = multiple
        self.taskOptions = options
        
        self.initDays()
    }
    
    private func initDays() {
        self.days = [
            "mon": true,
            "tue": true,
            "wed": true,
            "thu": true,
            "fri": true,
            "sat": true,
            "sun": true
        ]
    }
}

// getters and setters
extension Task {
    // Getters
    func getImage() -> UIImage? {
        return self.taskImage
    }
    
    func getName() -> String {
        return self.taskName
    }
    
    func getType() -> TaskType {
        return self.taskType
    }
    
    func getDays() -> WeekDay {
        return self.days
    }
    
    func getDay(name: String) -> Bool {
        if self.hasDay(name) {
            return self.days[name]!
        }
        
        return false
    }
    
    func isMultiple() -> Bool {
        return self.multiple
    }
    
    func getOptions() -> [TaskOption] {
        return self.taskOptions
    }
    
    // Setters
    
    func setType(type: TaskType) {
        self.taskType = type
    }
    
    func setDay(name: String, value: Bool) {
        if self.hasDay(name) {
            self.days[name] = value
        }
    }
    
    func setOptions(options: [TaskOption]) {
        self.taskOptions = options
    }
    
    func setOption(type: TaskOptionType, value: Bool) {
        for option in self.taskOptions {
            if option.getType() == type {
                option.setSelection(selected: value)
            }
        }
    }
    
    func setMultiple(multiple: Bool) {
        self.multiple = multiple
    }
}

// validators

extension Task {
    private func hasDay(_ name: String) -> Bool {
        return self.days.index(forKey: name) != nil
    }
}
