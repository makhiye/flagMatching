//
//  Game.swift
//  flag Matching
//
//  Created by ishmael on 7/19/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import Foundation
import AVFoundation

protocol MatchingGameDelegate {
    
    func game(_ game: Game, hideCards cards: [Int])
    
    
}

struct Game {
    
    var deckOfCards = DeckOfCards()
    let synthesizer = AVSpeechSynthesizer()
    var gameDelegate: MatchingGameDelegate?
    var unmatchedCardsRevealed: [Int] = []
    
    mutating func flipCard(atIndexNumber index: Int) -> Bool {
        
        if unmatchedCardsRevealed.count < 2 {
            unmatchedCardsRevealed.append(index)
            
            return true
        }else{
            
            resetUnmatchedcards()
            return false
            
        }
        
        
        
    }
    
    mutating func resetUnmatchedcards() {
        
        self.gameDelegate?.game(self, hideCards: unmatchedCardsRevealed)
        unmatchedCardsRevealed.removeAll()
    }
    
    func speakCard(number cardTag: Int){
        
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: deckOfCards.dealtCards[cardTag])
        synthesizer.speak(utterance)
        
    }
    
    
}
