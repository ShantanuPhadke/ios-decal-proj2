//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

var myHangman: Hangman = Hangman();

class HangmanViewController: UIViewController {
    
    @IBOutlet var past_guesses: UILabel!;
    @IBOutlet var new_guess: UITextField!;
    @IBOutlet var guess_btn: UIButton?;
    @IBOutlet var new_game: UIButton?;
    @IBOutlet var hangview: UIImageView!;
    
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hangview.image = UIImage(named: "hangman1.gif");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

