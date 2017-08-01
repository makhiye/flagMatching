//
//  GameViewController.swift
//  flag Matching
//
//  Created by ishmael on 7/17/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import UIKit
import LTMorphingLabel


class GameViewController: UIViewController, MatchingGameDelegate {
    
    var game = Game()
    var gameNumber = 1
    
    
    
    @IBOutlet weak var gameLabel: LTMorphingLabel!
    
    
    @IBOutlet weak var cardButton: UIButton!
   
    var counter = 0
    
    @IBAction func cardTapped(_ sender: UIButton) {
        
      let tagNum = sender.tag
        if game.flipCard(atIndexNumber: tagNum-1){
            let thisImage = UIImage(named: game.deckOfCards.dealtCards[tagNum - 1])
            
            UIView.transition(with: sender, duration: 0.5, options: . transitionCurlDown, animations: {sender.setImage(thisImage, for: .normal)}, completion: nil)
            
        game.speakCard(number: tagNum - 1)
    }
    
}
    
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        
        counter += 1
        
        for tagNum in 1...12 {
            
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton{
                
                thisButton.setImage(#imageLiteral(resourceName: "AACard"), for: .normal)
                
            }
            
        }
        
        game.deckOfCards.drawCards()
        gameNumber += 1
        gameLabel.text = "Game #\(gameNumber)"
        
        
    }
    
    
    func game(_ game: Game, hideCards cards: [Int]) {
        
        for cardIndex in cards {
            
            if let thisButton = self.view.viewWithTag(cardIndex+1) as? UIButton{
                
                thisButton.setImage(#imageLiteral(resourceName: "AACard"), for: .normal)
            
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    game.gameDelegate = self // setting gameDelegate to game
        
        gameLabel.morphingEffect = .burn
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

