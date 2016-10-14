//
//  ViewController.swift
//  midterm
//
//  Created by Zach Lamb on 10/14/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workoutTime: UITextField!
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutType: UISegmentedControl!
    @IBOutlet weak var weekSwitch: UISwitch!
    
    let pacePerMins = 10.00 //miles per min
    let pacePerHr = 6.00 //miles per hour
    let caloriesPerHour = 600.00
    let bikePace = 4.00
    let bikeCals = 510.00
    let swimPace = 30.00
    let swimCals = 420.00
    var workFrequency = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculateWorkout(sender: AnyObject) {
        if(Double(workoutTime.text!)! < 30.00){
            //create a UIAlertController object
            let alert=UIAlertController(title: "Warning", message: "This workout is less than 30 minutes", preferredStyle:
                UIAlertControllerStyle.Alert)
            //create a UIAlertAction object for the button
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style:UIAlertActionStyle.Cancel, handler: nil)
            //add the alert action to the alert object
            alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style:
            UIAlertActionStyle.Default, handler: { action in
                self.workoutTime.text="30"
        })
        alert.addAction(okAction)
        //present alert
        presentViewController(alert, animated: true, completion: nil)
        }
        if(workoutType.selectedSegmentIndex==0){
            //run
            workoutImage.image=UIImage(named: "run.png")
            miles.text=String(format: "%.01f",pacePerMins/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",caloriesPerHour/Double(workoutTime.text!)!)
        }
        else if(workoutType.selectedSegmentIndex==1){
            //swim
            workoutImage.image=UIImage(named: "swim.png")
            miles.text=String(format: "%.01f",swimPace/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",swimCals/Double(workoutTime.text!)!)
        }
        else if(workoutType.selectedSegmentIndex==2){
            //bike
            workoutImage.image=UIImage(named: "bike.png")
            miles.text=String(format: "%.01f",bikePace/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",bikeCals/Double(workoutTime.text!)!)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func textFieldShouldReturn(sender: AnyObject) {
    }
    @IBAction func workoutType(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex==0){
            //run
            workoutImage.image=UIImage(named: "run.png")
            miles.text=String(format: "%.01f",pacePerMins/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",caloriesPerHour/Double(workoutTime.text!)!)
        }
        else if(sender.selectedSegmentIndex==1){
            //swim
            workoutImage.image=UIImage(named: "swim.png")
            miles.text=String(format: "%.01f",swimPace/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",swimCals/Double(workoutTime.text!)!)
        }
        else if(sender.selectedSegmentIndex==2){
            //bike
            workoutImage.image=UIImage(named: "bike.png")
            miles.text=String(format: "%.01f",bikePace/Double(workoutTime.text!)!)
            calories.text=String(format: "%.01f",bikeCals/Double(workoutTime.text!)!)
        }
    }
    @IBAction func switchDaysOrWeeks(sender: UISwitch) {
        
        if(weekSwitch.on){
            
            if(miles.text != "...."){
                let numMiles = Double(miles.text!)!
                miles.text=String(format: "%.01f",numMiles*5.0)
                let numCalories = Double(calories.text!)!
                calories.text=String(format: "%.01f",numCalories*5.0)
            }
        }
        else if (!weekSwitch.on){
            if(miles.text != "...."){
                let numMiles = Double(miles.text!)!
                miles.text=String(format: "%.01f",numMiles/5.0)
                let numCalories = Double(calories.text!)!
                calories.text=String(format: "%.01f",numCalories/5.0)
            }
        }
        
    }
    
    
}

