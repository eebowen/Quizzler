//
//  Question.swift
//  Quizzler
//
//  Created by Zhang on 7/12/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    var question : String
    var answer : Bool
    
    init(text:String, correctAnswer:Bool){
        question = text
        answer = correctAnswer
    }
}
