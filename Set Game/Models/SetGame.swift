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
             print("playing Deck \(playingTwelveDeck)")
        
       
             
    }
    
    func clearAllSelectedCards(array: inout Array<SetCard>) {
        for index in 0..<array.count {
            array[index].isSelected = false
        }
    }
    
  
    mutating func choose(setCard: SetCard) {
        if let index = playingTwelveDeck.firstIndex(of: setCard){
            playingTwelveDeck[index].isSelected = true
            isFaceUpCardCount += 1
        }
        if isFaceUpCardCount == 2 {
            var selectedCardsArray = playingTwelveDeck.filter { $0.isSelected == true }
            selectedCardsArray.append(setCard)
            
            if (selectedCardsArray[0].count, selectedCardsArray[1].count) == (selectedCardsArray[1].count, selectedCardsArray[2].count) || (selectedCardsArray[0].count, selectedCardsArray[1].count) != (selectedCardsArray[1].count, selectedCardsArray[2].count){

                
                if (selectedCardsArray[0].shapeName, selectedCardsArray[1].shapeName) == (selectedCardsArray[1].shapeName, selectedCardsArray[2].shapeName) || (selectedCardsArray[0].shapeName, selectedCardsArray[1].shapeName) != (selectedCardsArray[1].shapeName, selectedCardsArray[2].shapeName) {
                    
                        if (selectedCardsArray[0].color, selectedCardsArray[1].color) == (selectedCardsArray[1].color, selectedCardsArray[2].color) || (selectedCardsArray[0].color, selectedCardsArray[1].color) != (selectedCardsArray[1].color, selectedCardsArray[2].color) {
                            
                            
                            
                            if (selectedCardsArray[0].shading, selectedCardsArray[1].shading) == (selectedCardsArray[1].shading, selectedCardsArray[2].shading) || (selectedCardsArray[0].shading, selectedCardsArray[1].shading) != (selectedCardsArray[1].shading, selectedCardsArray[2].shading) {
                                                                            
                                for index in 0..<3 {
                                    
                                    selectedCardsArray[index].isMatched = true
                                }
                                
                                
                                                              for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                                  for selectedCardIndex in selectedCardsArray.indices {
                                                                      if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                                          playingTwelveDeck[playingTwelveDeckIndex].isMatched = true
                                                                      }
                                                                  }
                                                              }
                                isFaceUpCardCount = 0
                                
                                
                                }else {
                                clearAllSelectedCards(array: &selectedCardsArray)
                                for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                    for selectedCardIndex in selectedCardsArray.indices {
                                        if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                            playingTwelveDeck[playingTwelveDeckIndex].isMatched = false
                                        }
                                    }
                                }
                                isFaceUpCardCount = 0
                                        return
                                
                            }
                            
                            
                            
                        }else {
                            clearAllSelectedCards(array: &selectedCardsArray)
                                                          for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                              for selectedCardIndex in selectedCardsArray.indices {
                                                                  if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                                      playingTwelveDeck[playingTwelveDeckIndex].isMatched = false
                                                                  }
                                                              }
                                                          }
                            isFaceUpCardCount = 0
                            return
                            
                    }
                    
                    
                }else {
                    clearAllSelectedCards(array: &selectedCardsArray)
                                                  for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                      for selectedCardIndex in selectedCardsArray.indices {
                                                          if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                              playingTwelveDeck[playingTwelveDeckIndex].isMatched = false
                                                          }
                                                      }
                                                  }
                    isFaceUpCardCount = 0
                    return
                    
                    
                }
        }else {
                clearAllSelectedCards(array: &selectedCardsArray)
                                              for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                  for selectedCardIndex in selectedCardsArray.indices {
                                                      if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                          playingTwelveDeck[playingTwelveDeckIndex].isMatched = false
                                                      }
                                                  }
                                              }
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
