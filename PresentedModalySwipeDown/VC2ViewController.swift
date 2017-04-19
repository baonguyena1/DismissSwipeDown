//
//  VC2ViewController.swift
//  PresentedModalySwipeDown
//
//  Created by Bao Nguyen on 4/19/17.
//  Copyright © 2017 Bao Nguyen. All rights reserved.
//

import UIKit

class VC2ViewController: UIViewController {
    
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view.window)
        if sender.state == .began {
            initialTouchPoint = touchPoint
            
        } else if sender.state == .changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.width, height: self.view.frame.height)
            }
            
        } else if sender.state == .ended || sender.state == .cancelled {
            if touchPoint.y - initialTouchPoint.y > 300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.view.frame = CGRect(x: 0, y: 0, width: strongSelf.view.frame.width, height: strongSelf.view.frame.height)
                })
            }
            
        }
        
    }

}
