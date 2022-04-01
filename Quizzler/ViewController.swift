//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let all = Questionbank()
    var pick : Bool = false
    var questionnumber = 0
    var score = 0
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var widthprogress: NSLayoutConstraint!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pick=true
            
        }
        else if sender.tag==2{
            pick=false
        }
        checkAnswer()
        questionnumber+=1
    
    nextQuestion()
    
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionnumber + 1) / 13"
        
//        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionnumber + 1)
        widthprogress.constant = (view.frame.size.width / 13) * CGFloat(questionnumber + 1)
    }
    

    func nextQuestion() {
        if questionnumber<=12 {
            
        
        questionLabel.text = all.list[questionnumber].questiontext
            
            updateUI()
        }
        else{
            
            let alert = UIAlertController(title: "good", message: "all done wanna restart", preferredStyle: .alert)
            
            let restartaction = UIAlertAction(title: "restart", style: .default) {
                UIAlertAction in
                self.startOver()
            }
            alert.addAction(restartaction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctanswer = all.list[questionnumber].answer
        if correctanswer==pick{
            print("right")
            score += 1
        }
        else {
            print("wrong")
        }
        
    }
    
    
    func startOver() {
        score=0
       
        questionnumber = 0
        nextQuestion()
    }
    

    
}
