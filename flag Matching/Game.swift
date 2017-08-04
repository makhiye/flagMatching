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
    var unmatchedCardsRevealed: [Int] = [] // card index numbers that have been revealed
    var sound = AVAudioPlayer() // add sound player
    var waitingForHidingCards = false //When start game we not waiting
    
    var unMatchedCards: [Int] = [] // card index numbers that matches
    
    init(){
        
        newGame()
        
    }
    
    mutating func flipCard(atIndexNumber index: Int) -> Bool {
        
        if waitingForHidingCards {return false}
        
        if !unmatchedCardsRevealed.isEmpty && unmatchedCardsRevealed[0] == index {return false} //this is not the first tap ()its the second
        
        if !unMatchedCards.contains(index) {return false} // Card has already been matched
       
        
        if unmatchedCardsRevealed.count < 2 {
            unmatchedCardsRevealed.append(index)
            
            if unmatchedCardsRevealed.count == 2 {
                let card1Name = deckOfCards.dealtCards[unmatchedCardsRevealed[0]]
                let card2Name = deckOfCards.dealtCards[unmatchedCardsRevealed[1]]
                
                if card1Name == card2Name{ // second card is a match
                    
                    for (indexCounter, cardIndexValue) in unMatchedCards.enumerated().reversed(){
                        
                        
                        if cardIndexValue == unmatchedCardsRevealed[0] || cardIndexValue == unmatchedCardsRevealed[1]{
                            
                            unMatchedCards.remove(at: indexCounter)
                        }
                        
                    }
                    
                    speakCard(number: index)
                    unmatchedCardsRevealed.removeAll()

                    
                }else {                  // second card is NOT a match
                    
                    
                    resetUnmatchedcards()
                    
                }
                
                playFlipSound()
                
            }
            
            return true
        }else{
            
            print("ERROR: This should be here")
            return false
            
        }
    }
    
    mutating func newGame(){
        
        playFlipSound()
        
        deckOfCards.drawCards()
        
        for  (index, _) in deckOfCards.dealtCards.enumerated() {
            
            unMatchedCards.append(index)
        }

    }
    
    mutating func playFlipSound() {
        
        let path = Bundle.main.path(forResource: "card-flip", ofType: "mp3")
        playSound(withPath: path!)
    }
    mutating func playShuffleSound() {
        let path = Bundle.main.path(forResource: "shuffle", ofType: "wav")
        playSound(withPath: path!)
    }
    
    //Plays any sound that you pass a path to
    mutating func playSound(withPath path: String) {
        
        
        let soundURL = URL(fileURLWithPath: path)
        do {
            try sound = AVAudioPlayer(contentsOf: soundURL)
            sound.prepareToPlay()
            
        } catch {
            
            print("ERROR! Couldn’t load sound file")
        }
        
        sound.play()
    }
    
    
    mutating func resetUnmatchedcards() {
        
        waitingForHidingCards = true // Tobe  reset in the hideCards methods
        
        self.gameDelegate?.game(self, hideCards: unmatchedCardsRevealed)
        unmatchedCardsRevealed.removeAll()
    }
    
    func speakCard(number cardTag: Int){
        
        synthesizer.stopSpeaking(at: .immediate)
        
        let utterance = AVSpeechUtterance(string: deckOfCards.dealtCards[cardTag])
        
        synthesizer.speak(utterance)
        
    }
    
    
}
