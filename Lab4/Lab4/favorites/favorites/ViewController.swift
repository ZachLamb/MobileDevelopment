//
//  ViewController.swift
//  favorites
//
//  Created by Zach Lamb on 9/27/16.
//  Copyright © 2016 Zach Lamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var user=Favorite()
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        bookLabel.text=user.favBook
        authorLabel.text=user.favAuthor
        genreLabel.text=user.favGenre
        
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

