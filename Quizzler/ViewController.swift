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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = sender.tag == 1 ? true : false
        
        checkAnswer()
        questionNumber += 1
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if (questionNumber <= 12) {
          questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            print("End of Quiz")
            questionLabel.text
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        correctAnswer == pickedAnswer ? print("You Got It!") : print("Wrong!")
    }
    
    
    func startOver() {
       
    }
    

    
}
