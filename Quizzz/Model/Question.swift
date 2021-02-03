//
//  Question.swift
//  Quizzz
//
//  Created by Dima on 1/31/21.
//

import Foundation

struct Question {
    let questionText: String
    let answer: String

    init(q: String, a: String) {
        questionText = q
        answer = a
    }
    
}
