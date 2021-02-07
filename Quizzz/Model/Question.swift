//
//  Question.swift
//  Quizzz
//
//  Created by Dima on 1/31/21.
//

import Foundation

struct Question {
    let questionText: String
    let answerOne: String
    let answerTwo: String
    let answerThree: String
    let answerFour: String
    let correctAnswer: String

    init(q: String, a1: String, a2: String, a3: String, a4: String, ca: String) {
        questionText = q
        answerOne = a1
        answerTwo = a2
        answerThree = a3
        answerFour = a4
        correctAnswer = ca
    }
    
}
