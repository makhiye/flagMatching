//
//  GameViewController.swift
//  flag Matching
//
//  Created by ishmael on 7/17/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import UIKit


class GameViewController: UIViewController, MatchingGameDelegate {
    
    var game = Game()
    
    
    @IBOutlet weak var cardButton: UIButton!
   
    
    @IBAction func cardTapped(_ sender: UIButton) {
        
      let tagNum = sender.tag
        if game.flipCard(atIndexNumber: tagNum-1){
            
           let thisImage = UIImage(named: game.deckOfCards.dealtCards[tagNum - 1])
            sender.setBackgroundImage(thisImage, for: .normal)
        
        
        game.speakCard(number: tagNum - 1)
    }
    
}
    
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        for tagNum in 1...12 {
            
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton{
                
                thisButton.setBackgroundImage(#imageLiteral(resourceName: "AACard"), for: .normal)
                
            }
            
        }
        
        game.deckOfCards.drawCards()
    }
    
    
    func game(_ game: Game, hideCards cards: [Int]) {
        
        for cardIndex in cards {
            
            if let thisButton = self.view.viewWithTag(cardIndex+1) as? UIButton{
                
                thisButton.setBackgroundImage(#imageLiteral(resourceName: "AACard"), for: .normal)
            
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    game.gameDelegate = self // setting gameDelegate to game
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

