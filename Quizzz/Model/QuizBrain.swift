//
//  QuizBrain.swift
//  Quizzz
//
//  Created by Dima on 2/1/21.
//

import UIKit

struct QuizBrain {
    var questionNumber = 0
    var score = 0
    
    let quizArray = [Question(q: "Передавать", a1: "Bypass", a2: "Pass", a3: "Case study" , a4: "Base camp", ca: "Pass"),
                     Question(q: "Поэтому", a1: "Thirdly", a2: "Therethrough", a3: "Wherefore" , a4: "Therefore", ca: "Therefore"),
                     Question(q: "Многообещающий", a1: "Prosy", a2: "Promising", a3: "Unpromising" , a4: "Prospective", ca: "Promising"),
                     Question(q: "Сравнивать", a1: "Company", a2: "Confer", a3: "Compare" , a4: "Conglomerate", ca: "Compare"),
                     Question(q: "Затвердевать", a1: "Soundproof", a2: "Solidify", a3: "Solace" , a4: "Sound", ca: "Solidify")]

    func getQuestionText() -> String {
        return quizArray[questionNumber].questionText
    }

    mutating func nextQuestion() {
        if questionNumber + 1 < quizArray.count {
            questionNumber = questionNumber + 1
        } else {
            print("Молодец у тебя \(score) правильных ответов!")
            questionNumber = 0
            score = 0
        }
    }

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizArray[questionNumber].correctAnswer {
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

    //MARK: - Get button titles

    func getChoiceButtonOneText() -> String {
        return quizArray[questionNumber].answerOne
    }

    func getChoiceButtonTwoText() -> String {
        return quizArray[questionNumber].answerTwo
    }

    func getChoiceButtonThreeText() -> String {
        return quizArray[questionNumber].answerThree
    }

    func getChoiceButtonFourText() -> String {
        return quizArray[questionNumber].answerFour
    }

}
