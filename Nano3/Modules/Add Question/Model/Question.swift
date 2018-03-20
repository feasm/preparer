//
//  Question.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import Foundation

class Question {
    private var question: String!
    private var correctAnswer: String!
    private var testAnswer: String = ""
    
    init(question: String, answer: String) {
        self.question = question
        self.correctAnswer = answer
    }
    
    func restart() {
        testAnswer = ""
    }
}

// getters and setters
extension Question {
    func getQuestion() -> String {
        return question
    }
    
    func getCorrectAnswer() -> String {
        return correctAnswer
    }
    
    func getTestAnswer() -> String {
        return testAnswer
    }
}
