//
//  QuizManagerDelegate.swift
//  Quizzz
//
//  Created by Dima on 2/13/21.
//

import Foundation

protocol QuizManagerDelegate {
    func didUpdateArray(quiz: QuestionModel)
    func didFailWithError(error: Error)
}
