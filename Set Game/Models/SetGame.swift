//
//  SetGame.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import Foundation


struct SetGame {
    
    var deck : Array<SetCard> = []
    var playingTwelveDeck : Array<SetCard> = []
    var addedTwelveCards = false
    
    
    
   private var isFaceUpCardCount = 0
    
    init(deck: Array<SetCard>){
        self.deck = deck
        if self.deck.count >= 12 && !addedTwelveCards{
                 for _ in 1...12 {
                    self.playingTwelveDeck.append(self.deck.remove(at: 0))
                 }
             }
             addedTwelveCards = true
             print("new deck count: \(deck.count)")
             
        
       
             
    }
    
    mutating func addThreeCardsToPlayingDeck() {
        for _ in 1...3 {
            self.playingTwelveDeck.append(self.deck.remove(at: 0))
        }
    }
    
    mutating func clearAllSelected() {
        for index in playingTwelveDeck.indices {
            playingTwelveDeck[index].isSelected = false
        }
    }
 
    
  
    mutating func choose(setCard: SetCard) {
        if let index = playingTwelveDeck.firstIndex(of: setCard){
            if !playingTwelveDeck[index].isSelected {
                playingTwelveDeck[index].isSelected = true
                isFaceUpCardCount += 1
            }
            
        }
        if isFaceUpCardCount == 3 {
            var selectedCardsArray : Array<SetCard> = []
            for index in playingTwelveDeck.indices {
                if playingTwelveDeck[index].isSelected == true {
                    selectedCardsArray.append(playingTwelveDeck[index])
                    print("selectedArray: \(selectedCardsArray.count)")
                }
            }
            
            
            if ((selectedCardsArray[0].count == selectedCardsArray[1].count) && (selectedCardsArray[1].count == selectedCardsArray[2].count)) || ((selectedCardsArray[0].count != selectedCardsArray[1].count) && (selectedCardsArray[1].count != selectedCardsArray[2].count) && (selectedCardsArray[0].count != selectedCardsArray[2].count)){
                print("passed count")
                
                if ((selectedCardsArray[0].shapeName == selectedCardsArray[1].shapeName) && (selectedCardsArray[1].shapeName == selectedCardsArray[2].shapeName)) || ((selectedCardsArray[0].shapeName != selectedCardsArray[1].shapeName) && (selectedCardsArray[1].shapeName != selectedCardsArray[2].shapeName) && (selectedCardsArray[0].shapeName != selectedCardsArray[2].shapeName)) {
                    
                    print("passed shapName")
                    
                        if ((selectedCardsArray[0].color == selectedCardsArray[1].color) && (selectedCardsArray[1].color == selectedCardsArray[2].color)) || ((selectedCardsArray[0].color != selectedCardsArray[1].color) && (selectedCardsArray[1].color != selectedCardsArray[2].color) && (selectedCardsArray[0].color != selectedCardsArray[2].color)) {
                            
                            print("passed color")
                            
                            if ((selectedCardsArray[0].shading == selectedCardsArray[1].shading) && (selectedCardsArray[1].shading == selectedCardsArray[2].shading)) || ((selectedCardsArray[0].shading != selectedCardsArray[1].shading) && (selectedCardsArray[1].shading != selectedCardsArray[2].shading) && (selectedCardsArray[0].shading != selectedCardsArray[2].shading)) {
                                                                    
                                print("passed shading")
                                for index in 0..<3 {
                                    
                                    selectedCardsArray[index].isMatched = true
                                }
                                
                                
                                                              for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                                  for selectedCardIndex in selectedCardsArray.indices {
                                                                      if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                                          print("card Value : \(playingTwelveDeck[playingTwelveDeckIndex])")
                                                                          playingTwelveDeck[playingTwelveDeckIndex].isMatched = true
                                                                          addThreeCardsToPlayingDeck()
                                                                      }
                                                                  }
                                                              }
                                isFaceUpCardCount = 0
                                
                                
                                }else {
                                clearAllSelected()
                                isFaceUpCardCount = 0
                                        return
                                
                            }
                            
                            
                            
                        }else {
                            clearAllSelected()
                            isFaceUpCardCount = 0
                            return
                            
                    }
                    
                    
                }else {
                    clearAllSelected()
                    isFaceUpCardCount = 0
                    return
                    
                    
                }
        }else {
                clearAllSelected()
                isFaceUpCardCount = 0
                return
                
            }
    }
       
}
 

    
    
    struct SetCard : Identifiable {
      
        
        var color : ColorValue
        var shapeName : ShapeName
        var shading : Shadings
        var count : Int
        var isSelected = false
        var isMatched = false
        
        var id = UUID()
        
        
    }
}
