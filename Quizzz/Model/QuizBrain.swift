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
    
    var quizArray = [QuestionModel]()

    //MARK: - Get Question Test

    func getQuestionText() -> String {
        return quizArray[questionNumber].questionText
    }

    //MARK: - Change the question number

    mutating func nextQuestion() {
        if questionNumber + 1 < quizArray.count {
            questionNumber = questionNumber + 1
        } else {
            print("Молодец у тебя \(score) правильных ответов!")
            questionNumber = 0
            score = 0
        }
    }

    //MARK: - Check the User's Answer

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizArray[questionNumber].answerFour {
            score += 1
            return true
        } else {
            return false
        }
    }

    //MARK: - Get Score

    func getScore() -> Int {
        return score
    }

    //MARK: - Get Progress

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
