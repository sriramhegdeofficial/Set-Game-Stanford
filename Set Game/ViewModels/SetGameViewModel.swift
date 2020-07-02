//
//  SetGameViewModel.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    
    @Published private var setGameModel : SetGame<Color, ShapeName, Shadings>
    
    
    static let colors = [Color.red, Color.green, Color.blue]
    static let shapes = [ShapeName.Capsule, ShapeName.Circle, ShapeName.Square]
    static let shadings = [Shadings.fill, Shadings.striped, Shadings.stroked]
    
    var getFirstTwelveSetCards : Array<SetGame<Color, ShapeName, Shadings>.SetCard> = []
    
    init() {
        self.setGameModel = SetGame<Color, ShapeName, Shadings>(deck:  Self.createSetGameDeck())
        self.getFirstTwelveSetCards = self.setGameModel.getTwelveCards()
    }
     
    static  func createSetGameDeck() -> Array<SetGame<Color, ShapeName, Shadings>.SetCard> {
        var deck : Array<SetGame<Color, ShapeName, Shadings>.SetCard> = []
        
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        for count in 1...3 {
                            let setCard = SetGame<Color, ShapeName, Shadings>.SetCard(color: color, shapeName: shape, shading: shading, count: count)
                            deck.append(setCard)
                        }
                        
                    }
                }
            }
          deck.shuffle()
        print("\(deck.count)")
          return deck
        }
        
    // MARK: Intents
    
    func getCardCount() {
        setGameModel.printCardCount()
    }
    
    var deck : Array<SetGame<Color, ShapeName, Shadings>.SetCard> {
        get {
            
            setGameModel.deck
        }
    }
    
    var addedTwelveCards : Bool {
        self.setGameModel.addedTwelveCards
    }
    
    
   
    
    
}


