//
//  ViewController.swift
//  Quizzler
//
import UIKit

class ViewController: UIViewController {
    let allQuestions = QuestionBank()
    var questionNumber : Int = 0 ; var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        //Call Check Answer Function Based on True/False Tag Identifier (1 or 2)
        checkAnswer(pickedAnswer: sender.tag == 1 ? true : false)
        nextQuestion()
        
    }
    
    
    func updateUI() {
        //Update Total Score Displayed to the User
        scoreLabel.text = String(score)
        
        //Update the Current Question / Total Questions Displayed to User
        progressLabel.text = (String(questionNumber)) + "/" + String(allQuestions.list.count)
      
    }
    

    func nextQuestion() {
        if (questionNumber < allQuestions.list.count) {
            questionNumber += 1
            questionLabel.text = allQuestions.list[questionNumber - 1].questionText
            updateUI()
            
        } else {
            //If Complete With all Questions Prompt User to Restart Quiz
            updateUI()
            let alert = UIAlertController(title:"Awesome", message: "You Finished All The Questions.  Would You Like To Start Over Again?", preferredStyle: .alert)

            let alertAction = UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default, handler: {_ in
                self.startOver()
            })
            
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(pickedAnswer: Bool) {
        let correctAnswer = allQuestions.list[questionNumber - 1].answer
        score += correctAnswer == pickedAnswer ? 1 : 0
    }
    
    
    func startOver() {
        questionNumber = 0 ; score = 0
        updateUI()
        nextQuestion()
    }
}
