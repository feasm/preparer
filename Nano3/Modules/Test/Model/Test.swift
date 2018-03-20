//
//  Test.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import Foundation

class Test {
    private var questions: [Question]!
    private var currentScore: Int = 0
    private var bestScore: Int = 0
    private var lastScore: Int = 0
    private var currentQuestion: Int = 0
    
    init() {
        questions = []
    }
    
    func startTest() {
        currentScore = 0
        currentQuestion = 0
    }
    
    func addPoint() {
        currentScore += 1
    }
    
    func setLastScore() {
        lastScore = currentScore
    }
    
    func setBestScore() {
        if currentScore > bestScore {
            bestScore = currentScore
        }
    }
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
    func getCurrentScore() -> String {
        return "\(currentScore)"
    }
    
    func getNextQuestion() -> Question? {
        guard currentQuestion < questions.count else {
            return nil
        }
        
        let question = questions[currentQuestion]
        currentQuestion += 1
        return question
    }
}
