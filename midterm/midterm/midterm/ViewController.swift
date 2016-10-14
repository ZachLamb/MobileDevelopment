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
    let pacePerMins = 10.00 //miles per min
    let pacePerHr = 6.00 //miles per hour
    let caloriesPerHour = 600.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculateWorkout(sender: AnyObject) {
        miles.text=String(format: "%.01f",pacePerMins/Double(workoutTime.text!)!)
        calories.text=String(format: "%.01f",caloriesPerHour/Double(workoutTime.text!)!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func textFieldShouldReturn(sender: AnyObject) {
    }

}

