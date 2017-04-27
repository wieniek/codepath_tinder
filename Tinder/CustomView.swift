//
//  CustomView.swift
//  Tinder
//
//  Created by Waseem Mohd on 4/26/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit

class CustomView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var customImageView: UIImageView!
  var initialCenter: CGPoint?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }
  
  func initSubviews() {
    // standard initialization logic
    let nib = UINib(nibName: "CustomView", bundle: nil)
    nib.instantiate(withOwner: self, options: nil)
    contentView.frame = bounds
    addSubview(contentView)
    customImageView.image = UIImage(named: "ryan")
    initialCenter = customImageView.center
  }
  
  @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
    
    if sender.state == .began {
      
      
      initialCenter = customImageView.center
      
    }
      
    else if sender.state == .changed {
      
      let translation = sender.translation(in: contentView)
      
      let velocityX = sender.velocity(in: contentView).x
      if velocityX > 0 {
        
        
        
        customImageView.center = CGPoint(x: (initialCenter?.x)! + translation.x, y: (initialCenter?.y)!)
        let angle = (translation.x * 30.0 / 160.0) * CGFloat(M_PI) / 180
        customImageView.transform = CGAffineTransform(rotationAngle: angle)
        
        if translation.x > 50.0 {
          
          UIView.animate(withDuration: 0.5, animations: {
            
            self.customImageView.center = CGPoint(x: (self.initialCenter?.x)! + translation.x, y: (self.initialCenter?.y)!)
            let angle = (translation.x * 30.0 / 160.0) * CGFloat(M_PI) / 180
            self.customImageView.transform = CGAffineTransform(rotationAngle: angle)
          })
        }
//      } else if translation.x < -50 {
//        
//        self.customImageView.center = CGPoint(x: (self.initialCenter?.x)! + translation.x, y: (self.initialCenter?.y)!)
//        let angle = (translation.x * 5.0 / 160.0) * CGFloat(M_PI) / 180
//        self.customImageView.transform = CGAffineTransform(rotationAngle: angle)
//        
//        
//      } else {
//        customImageView.transform = CGAffineTransform.identity
//      }
    }
  }
  
}
