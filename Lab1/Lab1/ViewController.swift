//
//  ViewController.swift
//  Lab1
//
//  Created by Zach Lamb on 9/7/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var natureImage: UIImageView!
    
    let coImages = ["Colorado1.png","Colorado2.png","Colorado3.png"]
    let orImages = ["Oregon1.png","Oregon2.png","Oregon3.png"]
    @IBAction func chooseState(sender: UIButton) {
        if sender.currentTitle=="CO"{
            natureImage.image=UIImage(named: coImages[Int(arc4random_uniform(UInt32(coImages.count)))])
        }
        else if sender.currentTitle=="OR"{
            natureImage.image=UIImage(named: orImages[Int(arc4random_uniform(UInt32(orImages.count)))])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

