//
//  ViewController.swift
//  Tapper
//
//  Created by Abdurrahman on 10/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfMaxTaps: Int = 0
    var currentTaps: Int = 0

    @IBOutlet weak var tapperLogo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var play: UIButton!
    
    @IBOutlet weak var starTap: UIButton!
    @IBOutlet weak var numberOfTaps: UILabel!
    @IBOutlet weak var maxTaps: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func starPressed(sender: UIButton) {
        currentTaps++
        numberOfTaps.text = "\(currentTaps)"
        
        if GameOver() {
            resetTaps()
        }
    }
    
    
    @IBAction func playPressed(sender: UIButton) {
        if textField.text != nil && textField.text != "" {
            tapperLogo.hidden = true
            textField.hidden = true
            play.hidden = true
            
            starTap.hidden = false
            maxTaps.hidden = false
            numberOfTaps.hidden = false
            leaveGame.hidden = false
            
            numberOfMaxTaps = Int(textField.text!)!
            currentTaps = 0
            
            updateText()
            maxTaps.text = "Current Max Taps: \(textField.text!)"
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please provide a max number of taps", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Got it!", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var leaveGame: UIButton!
    
    @IBAction func leaveGamePressed(sender: UIButton) {
        resetTaps()
    }
    
    func updateText() {
        numberOfTaps.text = "\(currentTaps)"
    }
    
    func resetTaps() {
        numberOfMaxTaps = 0; currentTaps = 0; numberOfTaps.text = ""; leaveGame.hidden = true
        
        starTap.hidden = true; numberOfTaps.hidden = true; maxTaps.hidden = true
        
        textField.hidden = false; tapperLogo.hidden = false; play.hidden = false;  textField.text = ""
    }
    
    func GameOver() -> Bool {
        if currentTaps >= numberOfMaxTaps {
            return true
        } else {
            return false
        }
    }
    
}

