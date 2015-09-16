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
  
    
    @IBAction func connectToChat(sender: UIButton) {
        //TODO: check for invalid entrys
        connectToTCPServer(self.host.text, port:self.port.text.toInt()!,userName: self.userName.text)
        showChatView()
        
    }
    
    
    func connectToTCPServer(host: String, port : Int, userName: String) -> Void{
        //TPC socket
       // var client:TCPClient = TCPClient(addr: host,port: port)
        
        var client:TCPClient = TCPClient(addr: "127.0.0.1", port: 5045)
        //try to connect
        var (success, errorMsg) = client.connect(timeout:1)
        if success{
            //premier acces au serveur avec la comande "iam"
            var (success, errorMsg) = client.send(str:"iam:\(userName)")
            if success{
                var data = client.read(1024*10)
                if let d=data{
                    if let str=String(bytes: d, encoding: NSUTF8StringEncoding){
                        println(str)
                    }
                }
                else{
                    println(errorMsg)
                }
            }
            else {
                println(errorMsg)
            }
            
        }
        else {
            println(errorMsg)
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
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
    
}
