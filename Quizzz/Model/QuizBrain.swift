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
    
    let quizArray = [Question(q: "Cheek - Щека", a: "True"),
        Question(q: "Mighty - Мочь", a: "False"),
        Question(q: "Dispassionate - бесстрастный", a: "True"),
        Question(q: "Assess - Доступ", a: "False"),
        Question(q: "Shifting - Переключать", a: "False"),
        Question(q: "Seesaw - Качели", a: "True"),
        Question(q: "Diverge - Диверсия", a: "False"),
        Question(q: "Stratum - Стратосфера", a: "False"),
        Question(q: "Idly - Лениво", a: "True"),
        Question(q: "Treasure - Удовольствие", a: "False"),
        Question(q: "Act - Акт", a: "False"),
        Question(q: "Pass - Передавать", a: "True")]

    func getQuestionText() -> String {
        return quizArray[questionNumber].questionText
    }

    mutating func nextQuestion() { 
        if questionNumber + 1 < quizArray.count {
            questionNumber = questionNumber + 1
        } else {
            questionNumber = 0
            score = 0
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

    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quizArray.count)
        return progress
    }
}
