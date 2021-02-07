//
//  ViewController.swift
//  Quizzz
//
//  Created by Dima on 1/31/21.
//

import UIKit

class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var questionTextLabel: UILabel!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var choiceFourButton: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.progress = 0.0
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        quizBrain.nextQuestion()
    }

    @objc func updateUI() {
        questionTextLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOneButton.backgroundColor = .clear
        choiceTwoButton.backgroundColor = .clear
        choiceThreeButton.backgroundColor = .clear
        choiceFourButton.backgroundColor = .clear

        choiceOneButton.setTitle(quizBrain.getChoiceButtonOneText(), for: .normal)
        choiceTwoButton.setTitle(quizBrain.getChoiceButtonTwoText(), for: .normal)
        choiceThreeButton.setTitle(quizBrain.getChoiceButtonThreeText(), for: .normal)
        choiceFourButton.setTitle(quizBrain.getChoiceButtonFourText(), for: .normal)
    }

}

