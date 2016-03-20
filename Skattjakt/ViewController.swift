//
//  ViewController.swift
//  Skattjakt
//
//  Created by Jens Utbult on 2016-03-19.
//  Copyright © 2016 Jens Utbult. All rights reserved.
//

import UIKit
import SpriteKit

struct Question {
    let question: String
    let answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var win: SKView!
    var scene: WinScene!
    
    let questions = [Question(question: "1 + 2", answer: "3"),
                     Question(question: "5 + 2", answer: "7"),
                     Question(question: "6 + 3", answer: "9"),
                     Question(question: "7 + 3", answer: "10"),
                     Question(question: "8 + 4", answer: "12")]
    var questionIndex = 0
    var currentQuestion:Question {
        return questions[questionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        win.showsFPS = true
//        win.showsNodeCount = true
        win.ignoresSiblingOrder = true
        scene = WinScene(size: win.bounds.size)
        scene.scaleMode = .ResizeFill

        win.presentScene(scene)
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        if questionIndex == questions.count {
            self.performSegueWithIdentifier("showClue", sender: self)
            return
        }
        question.text = "\(currentQuestion.question) = "
        scene.stop()
        answer.text = ""
        answer.becomeFirstResponder()
    }
    
    @IBAction func answerChanged(sender: UITextField) {
        if sender.text == currentQuestion.answer {
            scene.start()
            answer.resignFirstResponder()
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.scene.stop()
                self.questionIndex += 1
                self.loadNextQuestion()
            }
        }
    }
}
