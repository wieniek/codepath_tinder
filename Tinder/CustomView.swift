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
        if sender.state == .changed {

            let translation = sender.translation(in: contentView)

            let velocityX = sender.velocity(in: contentView).x

            if velocityX > 0 {

                customImageView.center = CGPoint(x: (initialCenter?.x)! + translation.x, y: (initialCenter?.y)!)
            } else {
                customImageView.center = initialCenter!
            }

        }
    }
    
}
