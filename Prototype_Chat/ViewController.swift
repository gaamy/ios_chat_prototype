//
//  ViewController.swift
//  Prototype_Chat
//
//  Created by David Gourde on 2015-09-03.
//  Copyright (c) 2015 David Gourde. All rights reserved.
//

import UIKit

//this view controller represents the chat main view controller
class ViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var monTexte: UITextField!
    @IBOutlet weak var messages: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */


    @IBAction func envoyer(sender: AnyObject) {
       
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        formatter.stringFromDate(date)
        
        messages.text! = formatter.stringFromDate(date) + "\t" + monTexte.text + "\n" + messages.text!;
        
        effacerMonTexte();
    }
    
    func refreshChat(){
    
    
    }
    
    
    
    func effacerMonTexte(){
        monTexte.text = "";
    }
    
        
    @IBAction func backToLoginView(sender: UIButton) {
        
        showFirstViewController()
        
    }
    
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }
    
    
    
}

