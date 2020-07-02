//
//  SetGameViewModel.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    
    @Published private var setGameModel : SetGame
    
    
    static let colors = [ColorValue.red, ColorValue.green, ColorValue.blue]
    static let shapes = [ShapeName.Capsule, ShapeName.Circle, ShapeName.Square]
    static let shadings = [Shadings.fill, Shadings.striped, Shadings.stroked]
    
    var playingTwelveSetCards : Array<SetGame.SetCard> {
        setGameModel.playingTwelveDeck
    }
    
    init() {
        self.setGameModel = SetGame(deck:  Self.createSetGameDeck())
        
    }
     
    static  func createSetGameDeck() -> Array<SetGame.SetCard> {
        var deck : Array<SetGame.SetCard> = []
        
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        for count in 1...3 {
                            let setCard = SetGame.SetCard(color: color, shapeName: shape, shading: shading, count: count)
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
    
   
    
    var deck : Array<SetGame.SetCard> {
        get {
            
            setGameModel.deck
        }
    }
    
   
    func choose(setCard: SetGame.SetCard) {
        self.setGameModel.choose(setCard: setCard)
    }
    
   
    
    
}


