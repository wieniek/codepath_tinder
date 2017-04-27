//
//  CardsViewController.swift
//  Tinder
//
//  Created by Wieniek Sliwinski on 4/26/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  
  var initialCenter: CGPoint?
  
  @IBOutlet weak var ryanImage: UIImageView!
  
  @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
    
    if sender.state == .changed {
      
      let translation = sender.translation(in: view)
      
      let velocityX = sender.velocity(in: view).x
      
      if velocityX > 0 {
        
        ryanImage.center = CGPoint(x: (initialCenter?.x)! + translation.x, y: (initialCenter?.y)!)
      }
      
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initialCenter = ryanImage.center
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
