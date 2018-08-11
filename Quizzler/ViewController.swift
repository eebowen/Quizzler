//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        // set the width of prograss bar.
        progressBar.frame.size.width = view.frame.size.width / 13 * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        if(questionNumber < allQuestions.list.count){
            questionLabel.text = allQuestions.list[questionNumber].question
            updateUI()
        }
        else{
            // Create alert
            let alert = UIAlertController(title: "Well Done!", message: "Well Done! Your score is \(score)/130. Do you want to start over? ", preferredStyle: .alert)
            
            // Create two actions(restart and cancel) in that alert
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (UIAlertAction) in
            }
            alert.addAction(restartAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        if(questionNumber < allQuestions.list.count){
            if(pickedAnswer == allQuestions.list[questionNumber].answer){
                ProgressHUD.showSuccess("Right Answer! +10")
                score += 10
            }
            else{
                ProgressHUD.showError("Woops! +0")
            }
        }
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
