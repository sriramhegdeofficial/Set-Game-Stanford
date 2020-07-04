//
//  SetGameView.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var setGameViewModel : SetGameViewModel
    
   
    
   
    
    var body: some View {
    
        
        
            
        Grid(self.setGameViewModel.playingTwelveSetCards) { setCard in
                          
          
                    SetCardView(setCard: setCard)
                
                        
                    .onTapGesture {
                            self.setGameViewModel.choose(setCard: setCard)
                    }
                
            
                
                
        
                
           
                           
                            
                            
                    }
                 
                    
    }
        
       
        
    
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameViewModel: SetGameViewModel())
    }
}



