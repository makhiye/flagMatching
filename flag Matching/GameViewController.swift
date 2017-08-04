//
//  GameViewController.swift
//  flag Matching
//
//  Created by ishmael on 7/17/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import UIKit
import LTMorphingLabel
import MZTimerLabel



class GameViewController: UIViewController, MatchingGameDelegate {
    
    var game = Game()
    var gameNumber = 1
    var stopWatch: MZTimerLabel!
   
    
    @IBOutlet weak var gameLabel: LTMorphingLabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var cardButton: UIButton!
    
    var counter = 0
    
    @IBAction func cardTapped(_ sender: UIButton) {
        
        let tagNum = sender.tag
        if game.flipCard(atIndexNumber: tagNum-1){
            let thisImage = UIImage(named: game.deckOfCards.dealtCards[tagNum - 1])
            
            UIView.transition(with: sender, duration: 0.5, options: .transitionCurlDown, animations: {sender.setImage(thisImage, for: .normal)}, completion: nil)
            
            
            
            
        }
        
    }
    
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        
        counter += 1
        
        for tagNum in 1...12 {
            
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton{
                
                UIView.transition(with: thisButton, duration: 0.5, options: .transitionCurlDown, animations: {
                    thisButton.setImage(#imageLiteral(resourceName: "AACard"), for: .normal)
                }, completion: nil)
                
                stopWatch.reset()
            }
            
        }
        
        
        gameNumber += 1
        gameLabel.text = "Game #\(gameNumber)"
        
        game.newGame()
        
    }
    
    
    func game(_ game: Game, hideCards cards: [Int]) {
        
        let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime){
            
            
            for cardIndex in cards {
                
                if let thisButton = self.view.viewWithTag(cardIndex+1) as? UIButton{
                    
                    UIView.transition(with: thisButton, duration: 0.5, options: .transitionCurlDown, animations: {
                        thisButton.setImage(#imageLiteral(resourceName: "AACard"), for: .normal)
                    }, completion: nil)

                    
                }
            }
            
            self.game.waitingForHidingCards = false // All unmatched are hidden
        }

    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.gameDelegate = self // setting gameDelegate to game
        
        gameLabel.morphingEffect = .burn
        
        stopWatch = MZTimerLabel.init(label: timerLabel)
        stopWatch.timeFormat = "mm:ss"
        stopWatch?.start()
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

