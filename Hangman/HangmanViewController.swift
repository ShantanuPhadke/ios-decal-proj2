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
    @IBOutlet var currentword: UILabel!;
    @IBOutlet var start_over: UIButton!;
    var wrong_guesses = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrong_guesses = 0;
        let xNSNumber = wrong_guesses as NSNumber;
        self.hangview.image = UIImage(named: "hangman" + xNSNumber.stringValue + ".gif");
        myHangman = Hangman();
        // Do any additional setup after loading the view, typically from a nib.
        self.new_guess.text = " ";
        myHangman.start();
        currentword.text = myHangman.knownString;
        self.past_guesses.text = " ";
    }
    
    @IBAction func newGuess (sender: UIButton){
        
        let new_character = new_guess.text?.uppercaseString
        if myHangman.guessLetter(new_character!){//If letter guessed is in answer
            currentword.text = myHangman.knownString;
            
            if currentword.text == myHangman.answer{
                //Get the pop-up
                let winner = UIAlertController(title: "Winner!", message: "You guessed the word correctly and won the game.", preferredStyle: .Alert);
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    self.viewDidLoad();
                }
                winner.addAction(OKAction);
                self.presentViewController(winner, animated: true){
                    
                }
                
                
            }
        }else{//If the wrong letter guessed
            wrong_guesses++;
            past_guesses.text = past_guesses.text! + new_character!;
            let xNSNumber = wrong_guesses as NSNumber;
            
            self.hangview.image = UIImage(named: "hangman" + xNSNumber.stringValue + ".gif");
            if(wrong_guesses == 7){
                //Get the 'bad' popup to come
                let loser = UIAlertController(title:"Loser!", message: "You didn't guess the secret word correctly in time, so you lost!", preferredStyle: .Alert);
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    self.viewDidLoad();
                }
                loser.addAction(OKAction);
                self.presentViewController(loser, animated: true){
                    
                }
                
            }
        }
        
        
        
        new_guess.text = "";
        
        
    }
    
    @IBAction func newGame (sender: UIButton){
        self.viewDidLoad();
    }
    
    @IBAction func startOver (sender: UIButton){
        self.past_guesses.text = "";
        self.new_guess.text = "";
        var reset = "";
        for (var i = 0; i < myHangman.knownString!.characters.count; i+=1){
            reset = reset + "_";
        }
        currentword.text = reset;
        wrong_guesses = 0;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

