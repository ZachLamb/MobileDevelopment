//
//  ViewController.swift
//  Lab2
//
//  Created by Zach Lamb on 9/8/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var natureImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var fontControl: UISegmentedControl!
    
    
    @IBAction func changeInfo(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text="Long's Peak"
            natureImage.image=UIImage(named: "Colorado")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text="Mount Hood"
            natureImage.image=UIImage(named: "Oregon")
        }
    }
    
    @IBAction func changeFont(sender: UISegmentedControl) {
        
        if fontControl.selectedSegmentIndex == 0 {
            titleLabel.font=UIFont(name: "SanFrancisco",size: 16)
        }
        else {
            titleLabel.font=UIFont(name: "HelveticaNeue",size: 16)
        }
    }
    
    @IBAction func updateFont(sender: UISwitch) {
        if capitalSwitch.on{
            titleLabel.text=titleLabel.text?.uppercaseString
        }
        else if !capitalSwitch.on{
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    @IBAction func changeFontSize(sender: UISlider) {
            let fontSize=sender.value //float
        print(fontSize)
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        //fontSizeLabel.text=String(format: "%.0f", fontSize) //convert float to String
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        titleLabel.font = UIFont.systemFontOfSize(fontSizeCGFloat)
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

