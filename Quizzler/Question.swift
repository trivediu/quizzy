//
//  Question.swift
//  Quizzler
//
//  Created by Uday Trivedi
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
