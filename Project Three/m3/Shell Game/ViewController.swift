//
//  ViewController.swift
//  Shell Game
//
//  Created by Zach Lamb on 9/28/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
// I used Stack Overflow for everything that I did not know how to do including making images hidden, delaying alerts, and animation of cups

import UIKit
import AVFoundation

//import 

class ViewController: UIViewController {
    
    @IBOutlet weak var cupOne: UIButton!
    @IBOutlet weak var cupTwo: UIButton!
    @IBOutlet weak var cupThree: UIButton!
    @IBOutlet weak var ball1: UIImageView!
    @IBOutlet weak var ball2: UIImageView!
    @IBOutlet weak var ball3: UIImageView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var switchTheme: UISegmentedControl!
    
    @IBOutlet weak var score: UILabel!
    
    var currentCup : String = ""
    var ballPosition : String = ""
    let balls = ["cupOne","cupTwo","cupThree"]
    let winTitle : String = "You Won!"
    let gameWin: String = "You won the game!!!!"
    let win : String = "Congratulations!"
    let loseTitle : String = "You Lost"
    let lose : String = "Oh, no try again!"
    var didWin : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        score.text=String(0)
        resetBall()
        }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    @IBAction func changeTheme(sender: UISegmentedControl) {
        if switchTheme.selectedSegmentIndex == 0 {
            cupOne.setImage(UIImage(named: "tree"),forState: .Normal)
            cupTwo.setImage(UIImage(named: "tree"),forState: .Normal)
            cupThree.setImage(UIImage(named: "tree"),forState: .Normal)
            ball1.image=UIImage(named: "christmasOrn")
            ball2.image=UIImage(named: "christmasOrn")
            ball3.image=UIImage(named: "christmasOrn")
        }
        else if switchTheme.selectedSegmentIndex == 1 {
            cupOne.setImage(UIImage(named: "cup"),forState: .Normal)
            cupTwo.setImage(UIImage(named: "cup"),forState: .Normal)
            cupThree.setImage(UIImage(named: "cup"),forState: .Normal)
            ball1.image=UIImage(named: "ball")
            ball2.image=UIImage(named: "ball")
            ball3.image=UIImage(named: "ball")
        }
    }

    
    func resetBall() {

        ballPosition = balls[Int(arc4random_uniform(UInt32(balls.count)))]
        if(ballPosition == "cupOne"){
            ball1.hidden=false
            ball2.hidden=true
            ball3.hidden=true
        }
        else if(ballPosition == "cupTwo"){
            ball2.hidden=false
            ball1.hidden=true
            ball3.hidden=true
        }
        else if(ballPosition == "cupThree"){
            ball3.hidden=false
            ball2.hidden=true
            ball1.hidden=true
        }
    }
    func hideBalls(){
        ball3.hidden=true
        ball2.hidden=true
        ball1.hidden=true
    }
    func rotate(cupChoice: UIButton){
        let position = cupChoice.frame.origin
        cupChoice.frame.origin=CGPoint(x: position.x, y: position.y+60)
        
        self.resetBall()
    }
    func moveCupBack(myCup: String,myMessage: String){
        if(myCup == "cupOne"){
            rotate(self.cupOne)
        }
        else if(myCup == "cupTwo"){
            rotate(self.cupTwo)
        }
        else{
            rotate(self.cupThree)
        }
        if(myMessage == self.win){
            self.score.text = String((Int(self.score.text!)!+1))
//            self.result.text = String(self.winTitle);
        }
    }
    func myAlert(myTitle: String,myMessage: String,myCup: String) {
        
        let alert=UIAlertController(title: myTitle, message: myMessage, preferredStyle:
            UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Continue", style:
            UIAlertActionStyle.Default, handler: { action in
                UIView.animateWithDuration(0.1, animations: {
                    self.moveCupBack(myCup,myMessage: myMessage)
                    },completion: nil)
        })
        alert.addAction(okAction)
        //present alert
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 0.7)), dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func chooseCup(sender: AnyObject) {
        
        let whichCup = sender.titleLabel!!.text
        var alertTitle : String
        var alertMessage : String
        currentCup = whichCup!
        
        UIView.animateWithDuration(0.1, animations: {
            if(whichCup == "cupOne"){
                let position = self.cupOne.frame.origin
                self.cupOne.frame.origin=CGPoint(x: position.x, y: position.y-60)
            }
            else if(whichCup == "cupTwo"){
                let position = self.cupTwo.frame.origin
                self.cupTwo.frame.origin=CGPoint(x: position.x, y: position.y-60)
            }
            else{
                let position = self.cupThree.frame.origin
                self.cupThree.frame.origin=CGPoint(x: position.x, y: position.y-60)
            }
            },completion: nil)
        
                if(self.ballPosition == whichCup){
                    if(score.text == "9"){
                        alertTitle = self.winTitle
                        alertMessage = self.gameWin
                    }
                    else{
                        alertTitle = self.winTitle
                        alertMessage = self.win
                    }
                    didWin = self.win
                    self.myAlert(alertTitle,myMessage: alertMessage, myCup: whichCup!)
                }
                else if(self.ballPosition != whichCup){
                    alertTitle = self.loseTitle
                    alertMessage = self.lose
                    didWin = self.lose
                    self.myAlert(alertTitle,myMessage: alertMessage, myCup: whichCup!)
                }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

