//
//  DragImg.swift
//  My Little Monster
//
//  Created by Ugo Besa on 29/01/2016.
//  Copyright © 2016 Ugo Besa. All rights reserved.
//

import Foundation
import UIKit

class DragImg : UIImageView {
    
    var originalPosition:CGPoint!
    var dropTareget:UIView? // we know it's an imageView but UIView is global. Can be reused for any views
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Don't forget in interface builder, check "user interaction enabled"
        
        originalPosition = self.center // not calling this method in init because in init the layaout is not still displayed + no viewDidLoad here
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y) 
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // We need to know where the object is dropped. Has to be dropped on the monster
        
        if let touch = touches.first, let target = dropTareget {
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position){
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        //go back
        self.center = originalPosition
    }
}
