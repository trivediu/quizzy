//
//  ViewController.swift
//  Quizzler
//
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    //initialize a question bank
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(allQuestions.list.count)
        nextQuestion()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = sender.tag == 1 ? true : false
        
        checkAnswer()
        //questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = String(score)
        progressLabel.text = (String(questionNumber)) + "/" + String(allQuestions.list.count)
      
    }
    

    func nextQuestion() {
    if (questionNumber < allQuestions.list.count) {
            questionNumber += 1
            questionLabel.text = allQuestions.list[questionNumber - 1].questionText
            updateUI()
            
            
        } else {
            updateUI()
            let alert = UIAlertController(title:"Awesome", message: "You Finished All The Questions.  Would You Like To Start Over Again?", preferredStyle: .alert)

            let alertAction = UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default, handler: {_ in
                self.startOver()
            })
            
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber - 1].answer
        score += correctAnswer == pickedAnswer ? 1 : 0
        //updateUI()
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    
} //End Class
