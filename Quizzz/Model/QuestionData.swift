//
//  QuestionData.swift
//  Quizzz
//
//  Created by Dima on 2/7/21.
//

import Foundation

// MARK: - QuestionName

struct QuestionData: Decodable {
    let results: [Result]
}

// MARK: - Result

struct Result: Decodable {
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case question
    }

}


