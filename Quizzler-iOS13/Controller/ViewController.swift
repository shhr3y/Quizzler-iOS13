//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer)
        
        if result {
             
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red 
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        scoreLable.text = "Score : \(quizBrain.score)"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
}

