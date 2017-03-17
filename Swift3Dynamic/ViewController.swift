//
//  ViewController.swift
//  Swift3Dynamic
//
//  Created by Ken Moody on 3/16/17.
//  Copyright © 2017 Ken Moody. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var groundView: UIView!
    
    var animator: UIDynamicAnimator!
    var ball: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ball = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        ball.layer.cornerRadius = 25
        ball.backgroundColor = UIColor.red
        
        self.view.addSubview(ball)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        addGravity()
    }
    
    func addGravity() {
        
        let gravity = UIGravityBehavior(items: [ball])
        animator.addBehavior(gravity)
        
        let collistion = UICollisionBehavior(items: [ball])
        collistion.addBoundary(withIdentifier: 1 as NSCopying, from: groundView.frame.origin, to: CGPoint(x: groundView.frame.origin.x + groundView.frame.width, y: groundView.frame.origin.y))
        
        animator.addBehavior(collistion)
        
        collistion.collisionDelegate = self
        
        
        let ballBahavior = UIDynamicItemBehavior(items: [ball])
        ballBahavior.elasticity = 0.75
        
        animator.addBehavior(ballBahavior)
        
       
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if NSNumber(integerLiteral: 1).isEqual(identifier) {
            ball.backgroundColor = UIColor.blue
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

