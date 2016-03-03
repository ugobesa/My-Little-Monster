//
//  MonsterImg.swift
//  My Little Monster
//
//  Created by Ugo Besa on 30/01/2016.
//  Copyright © 2016 Ugo Besa. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg:UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        playIdleAnimation()
    }
    
    func playIdleAnimation (){
        
        self.image = UIImage(named: "idle1.png") // Default image
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1 ; x <= 4 ; x++ {
            let img = UIImage(named: "idle\(x).png") // optional
            imgArray.append(img!) // the array demand something that's not an optional
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0 // Always breathing
        self.startAnimating()
        
    }
    
    
    func playDeathAnimation(){
        
        self.image = UIImage(named: "dead5.png") // Default
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1 ; x <= 5 ; x++ {
            let img = UIImage(named: "dead\(x).png") // optional
            imgArray.append(img!) // the array demand something that's not an optional
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1 // once
        self.startAnimating()
        
    }
}