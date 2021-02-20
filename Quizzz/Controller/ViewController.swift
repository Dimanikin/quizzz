//
//  ViewController.swift
//  Quizzz
//
//  Created by Dima on 1/31/21.
//

import UIKit

class ViewController: UIViewController {
    let quizNetworkManager = QuizNetworkManager()

    //MARK: - IBOutlets

    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var choiceFourButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    //MARK: - View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()

        quizNetworkManager.perfomRequest(with: Constants.urlString, completion: { [weak self] in self?.updateUI() })
        progressBar.progress = 0.0
    }

    //MARK: - Answer Button Pressed Action

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizNetworkManager.quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        quizNetworkManager.quizBrain.nextQuestion()
    }

    //MARK: - Update User Interface

    @objc func updateUI() {
        questionTextLabel.text = quizNetworkManager.quizBrain.getQuestionText()
        choiceOneButton.setTitle(quizNetworkManager.quizBrain.getChoiceButtonOneText(), for: .normal)
        choiceTwoButton.setTitle(quizNetworkManager.quizBrain.getChoiceButtonTwoText(), for: .normal)
        choiceThreeButton.setTitle(quizNetworkManager.quizBrain.getChoiceButtonThreeText(), for: .normal)
        choiceFourButton.setTitle(quizNetworkManager.quizBrain.getChoiceButtonFourText(), for: .normal)
        
        progressBar.progress = quizNetworkManager.quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizNetworkManager.quizBrain.getScore())"
        choiceOneButton.backgroundColor = .clear
        choiceTwoButton.backgroundColor = .clear
        choiceThreeButton.backgroundColor = .clear
        choiceFourButton.backgroundColor = .clear
    }

}
