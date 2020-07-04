//
//  Grid.swift
//  Set Game
//
//  Created by sriram on 01/07/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView> : View where Item : Identifiable, ItemView : View{
    private var items : Array<Item>
    private var viewForItem : (Item) -> ItemView
    
    
    
  
    
    
    init(_ items: Array<Item>, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
        
    }
    
    func getLayout(size: CGSize) -> GridLayout {
        GridLayout(size: size)
    }
    

    
    var body: some View {
        GeometryReader { geometry in
            
                
                    ForEach(self.items) { item in
                       self.viewForItem(item)
                        .frame(width: self.getLayout(size: geometry.size).itemSize.width,
                               height: self.getLayout(size: geometry.size).itemSize.height)
                                .position(self.getLayout(size: geometry.size)
                                    .location(ofItemAt: self.items.firstIndex(of: item)!))
                       
                        
                    
                
            }
        }
        
    }
}

