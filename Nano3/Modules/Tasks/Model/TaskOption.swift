//
//  TaskOption.swift
//  Nano3
//
//  Created by Felipe Melo on 2/7/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

enum TaskOptionType: String {
    case MORNING = "Morning"
    case AFTERNOON = "Afternoon"
    case NIGHT = "Night"
    case MULTIPLE = "Multiple"
}

class TaskOption {
    private var image: UIImage!
    private var type: TaskOptionType!
    private var selected: Bool?
    
    init(image: UIImage, type: TaskOptionType) {
        self.image = image
        self.type = type
        self.selected = false
    }
    
    init(image: UIImage, type: TaskOptionType, selected: Bool) {
        self.image = image
        self.type = type
        self.selected = selected
    }
}

// Getters and Setters
extension TaskOption {
    func getImage() -> UIImage {
        return self.image
    }
    
    func getType() -> TaskOptionType {
        return self.type
    }
    
    func getTypeValue() -> String {
        return self.type.rawValue
    }
    
    func getSelection() -> Bool? {
        return self.selected
    }
    
    func setSelection(selected: Bool) {
        self.selected = selected
    }
}
