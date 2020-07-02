//
//  SetGame.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import Foundation


struct SetGame<Color, Shape, Shadings> {
    
    var deck : Array<SetCard>
    var addedTwelveCards = false
    
    func printCardCount() {
        print("card count: \(deck.count)")
    }
    
    mutating func getASetCard() -> SetCard {
            deck.remove(at: 0)
        
    }
    
    mutating func getTwelveCards() -> Array<SetGame<Color, Shape, Shadings>.SetCard> {
        var cards : Array<SetGame<Color, Shape, Shadings>.SetCard> = []
        if deck.count >= 12 && !addedTwelveCards{
            for _ in 1...12 {
                cards.append(getASetCard())
            }
        }
        addedTwelveCards = true
        print("new deck count: \(deck.count)")
        return cards
    }
    
  
    
    
    struct SetCard : Identifiable {
      
        
        var color : Color
        var shapeName : ShapeName
        var shading : Shadings
        var count : Int
        var isSelected = false
        var id = UUID()
        
    }
}
