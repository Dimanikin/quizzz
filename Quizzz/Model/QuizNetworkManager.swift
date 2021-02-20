//
//  QuizNetworkManager.swift
//  Quizzz
//
//  Created by Dima on 2/7/21.
//

import Foundation

class QuizNetworkManager {
    var quizBrain = QuizBrain()

    //MARK: - Request Data

    func perfomRequest(with urlString: String, completion: (() -> Void)?) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, request, error) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    self.parseJSON(safeData: safeData)
                }
                DispatchQueue.main.async {
                    completion?()
                }
            }
            task.resume()
        }
    }

    //MARK: - Parsing JSON
    
    func parseJSON(safeData: Data) {

        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(QuestionData.self, from: safeData)

            for _ in decoderData.results {
                let questionText = decoderData.results[quizBrain.questionNumber].question
                let correctAnswer = decoderData.results[quizBrain.questionNumber].correctAnswer
                let incorrectAnswers = decoderData.results[quizBrain.questionNumber].incorrectAnswers

                let quiz = QuestionModel(q: questionText, a1: incorrectAnswers[0], a2: incorrectAnswers[1], a3: incorrectAnswers[2], a4: correctAnswer)
                quizBrain.questionNumber += 1
                quizBrain.quizArray.append(quiz)
            }
            quizBrain.questionNumber = 0
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
