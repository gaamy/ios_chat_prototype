//
//  loginScreenViewController.swift
//  Prototype_Chat
//
//  Created by Gabriel Amyot on 2015-09-13.
//  Copyright (c) 2015 David Gourde. All rights reserved.
//

import UIKit
import Foundation
import Darwin.C


class loginScreenViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

 
    //server information
    @IBOutlet weak var host: UITextField!
    @IBOutlet weak var port: UITextField!
    @IBOutlet weak var userName: UITextField!
  
    @IBOutlet weak var usernameReminder1: UILabel!
    
    @IBAction func connectToChat(sender: UIButton) {
        
        // checking for invalid entrys
        if (host.text == nil || host.text!.isEqual("")){
            print("-I need the ip address to connect to the host!-")
        }
        else if(port.text == nil || Int(port.text!) == nil){
            print("-If you realy want me to connect, give me the port!-")
        }
        else if(userName.text == nil || userName.text == ""){
            print("-You forgot your username?-")
            usernameReminder1.hidden = false
            
        }else if(true){//TODO: check if the connection is possible
            //connect
            //disconect
            usernameReminder1.hidden = true
            showChatView()
        }
    }
    
    

    /*
    * prepareForSegue()
    * this function are responsable for the data transfer 
    * between this view and th hat view!
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "idLoginSegue") {
            let chatViewController : ViewController = segue.destinationViewController as! ViewController
            
            chatViewController.host = self.host.text!
            chatViewController.port = Int(self.port.text!)!
            chatViewController.userName = self.userName.text!
        }
    }
    

    
    //go to the chat view
    func showChatView(){
        self.performSegueWithIdentifier("idLoginSegue", sender: self)
    }
    
  
    
    //when returns from an other view
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idFirstSegueUnwind" {
                let unwindSegue = CustonSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)!
    }
    
}
