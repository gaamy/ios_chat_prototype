//
//  CustonSegueUnwind.swift
//  Prototype_Chat
//
//  Created by Gabriel Amyot on 2015-09-13.
//  Copyright (c) 2015 David Gourde. All rights reserved.
//

import UIKit

class CustonSegueUnwind: UIStoryboardSegue {
   
    
    override func perform(){
        //Assign the sources and destination to local variables
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        //Animate the transition
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0,screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            }) {(Finished) -> Void in
                self.sourceViewController.dismissViewControllerAnimated(false,completion: nil)
        }
        
    }
    
    
}
