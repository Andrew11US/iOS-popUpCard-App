//
//  ViewController.swift
//  popUpCard
//
//  Created by Andrew on 3/17/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit
import pop

class ViewController: UIViewController {

    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func createCardFromNib() -> Card? {
        return Bundle.main.loadNibNamed("Card", owner: self, options: nil)?[0] as? Card
    }
    
    func showCard() {
        card = createCardFromNib()
        card.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(card)
    }
    
    func showNextCard() {
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            card = next
            
            AnimationEngine.animateToPosition(view: next, position: AnimationEngine.screenCenterPosition, completion: { (anim:POPAnimation?, finished: Bool) in
                
            })
        }
        
    }
    
    func hideCurrentCard() {
        if let current = card {
            let cardToRemove = current
            card = nil
            
            AnimationEngine.animateToPosition(view: cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim:POPAnimation?, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
    }
    
    @IBAction func show(_ sender: Any) {
        
        showNextCard()
    }
    
    @IBAction func hideCard(_ sender: Any) {
        
        hideCurrentCard()
    }
    

}

