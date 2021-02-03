//
//  QuizBrain.swift
//  Quizzz
//
//  Created by Dima on 2/1/21.
//

import Foundation

struct QuizBrain {
    var questionNumber = 0
    var score = 0
    
    let quizArray = [Question(questionText: "У кошки 4 лапки", answer: "True"),
    Question(questionText: "У собаки три лапки", answer: "False")]

    func getQuestionText() -> String {
        return quizArray[questionNumber].questionText
    }

    mutating func nextQuestion() { 
        if questionNumber + 1 < quizArray.count {
            questionNumber = questionNumber + 1
        } else {
            questionNumber = 0
        }
    }

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizArray[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getScore() -> Int {
        return score
    }
    
}
