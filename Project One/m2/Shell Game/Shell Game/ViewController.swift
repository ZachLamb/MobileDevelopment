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
    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var score: UILabel!
    
    
    var ballPosition : String?
    var ballPossiblities = [CGPoint]()
    let balls = ["cupOne","cupTwo","cupThree"]
    let winTitle : String = "You Won!"
    let win : String = "You Win!"
    let loseTitle : String = "You Lost"
    let lose : String = "Oh, no you lose :("
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text=String(0)
        reset()
        
    }
    
    func reset() {
        ballPosition = balls[Int(arc4random_uniform(UInt32(balls.count)))]
        ballPossiblities = [self.cupOne.frame.origin,self.cupTwo.frame.origin,self.cupThree.frame.origin]
        if(ballPosition == "cupOne"){
            let position = ballPossiblities[0]
            ball.frame.origin=CGPoint(x: position.x,y: position.y)
        }
        else if(ballPosition == "cupTwo"){
            let position = ballPossiblities[1]
            ball.frame.origin=CGPoint(x: position.x,y: position.y)
        }
        else if(ballPosition == "cupThree"){
            let position = ballPossiblities[2]
            ball.frame.origin=CGPoint(x: position.x,y: position.y)
        }
    }
    
    @IBAction func chooseCup(sender: AnyObject) {
        
        let whichCup = sender.titleLabel!!.text
        var alertTitle : String?
        var alertMessage : String?
        
        UIView.animateWithDuration(0.1, animations: {
            if(whichCup == "cupOne"){
                let position = self.cupOne.frame.origin
                self.cupOne.frame.origin=CGPoint(x: position.x, y: position.y-120)
            }
            else if(whichCup == "cupTwo"){
                let position = self.cupTwo.frame.origin
                self.cupTwo.frame.origin=CGPoint(x: position.x, y: position.y-120)
            }
            else{
                let position = self.cupThree.frame.origin
                self.cupThree.frame.origin=CGPoint(x: position.x, y: position.y-120)
            }
            },completion: nil)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 0.3)), dispatch_get_main_queue()) {
                if(self.ballPosition == whichCup){
                    print(whichCup)
                    alertTitle = self.winTitle
                    alertMessage = self.win
                }
                else if(self.ballPosition != whichCup){
                    print(self.ballPosition)
                    alertTitle = self.loseTitle
                    alertMessage = self.lose
                }
                //create a UIAlertController object
                let alert=UIAlertController(title: alertTitle, message: alertMessage, preferredStyle:
                    UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "Continue", style:
                    UIAlertActionStyle.Default, handler: { action in
                        UIView.animateWithDuration(0.1, animations: {
                            if(whichCup == "cupOne"){
                                let position = self.cupOne.frame.origin
                                self.cupOne.frame.origin=CGPoint(x: position.x, y: position.y+120)
                                self.reset()
                            }
                            else if(whichCup == "cupTwo"){
                                let position = self.cupTwo.frame.origin
                                self.cupTwo.frame.origin=CGPoint(x: position.x, y: position.y+120)
                                self.reset()
                            }
                            else{
                                let position = self.cupThree.frame.origin
                                self.cupThree.frame.origin=CGPoint(x: position.x, y: position.y+120)
                                self.reset()
                            }
                            },completion: nil)
                        if(alertMessage == self.win){
                        self.score.text = String((Int(self.score.text!)!+1))
                        }
                })
                alert.addAction(okAction)
                //present alert
                self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //object
    //cups
    //buttons
    //alerts
    //labels
    //score
//    alert with table view
//    function addNewUser(textField){
//        create new user here
//    }
//    function selectExistingUser(table){
//        return selected user
//    }
//    
//    signOut(){
//    sign out user and return to alert asking user to sign-in/up
//    }
//    
//    putObjectUnderCup(){
//    call random function to put object undercup
//    }
//    selectedCup(){
//    return if it is the right cup, and display result
//    also, update score if user selected correct cup
//    }
}

