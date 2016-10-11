//
//  ViewController.swift
//  Shell Game
//
//  Created by Zach Lamb on 9/28/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cupOne: UIButton!
    @IBOutlet weak var cupTwo: UIButton!
    @IBOutlet weak var cupThree: UIButton!
    @IBOutlet weak var ball1: UIImageView!
    @IBOutlet weak var ball2: UIImageView!
    @IBOutlet weak var ball3: UIImageView!
    
    @IBOutlet weak var score: UILabel!
    
    var currentCup : String = ""
    var ballPosition : String = ""
    let balls = ["cupOne","cupTwo","cupThree"]
    let winTitle : String = "You Won!"
    let win : String = "Congratulations!"
    let loseTitle : String = "You Lost"
    let lose : String = "Oh, no try again!"
    var didWin : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        score.text=String(0)
        reset()
        
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(event!.subtype == UIEventSubtype.MotionShake) {
            reset()
            self.dismissViewControllerAnimated(true, completion: nil)
            moveCupBack(currentCup,myMessage: didWin)
            
        }
    }

    
    func reset() {
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
    func moveCupBack(myCup: String,myMessage: String){
        if(myCup == "cupOne"){
            let position = self.cupOne.frame.origin
            self.cupOne.frame.origin=CGPoint(x: position.x, y: position.y+60)
            self.reset()
        }
        else if(myCup == "cupTwo"){
            let position = self.cupTwo.frame.origin
            self.cupTwo.frame.origin=CGPoint(x: position.x, y: position.y+60)
            self.reset()
        }
        else{
            let position = self.cupThree.frame.origin
            self.cupThree.frame.origin=CGPoint(x: position.x, y: position.y+60)
            self.reset()
        }
        if(myMessage == self.win){
            self.score.text = String((Int(self.score.text!)!+1))
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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 0.3)), dispatch_get_main_queue()) {
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
                    alertTitle = self.winTitle
                    alertMessage = self.win
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

