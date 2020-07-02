//
//  SetCardView.swift
//  Set Game
//
//  Created by sriram on 26/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

struct SetCardView: View  {
    
    var cornerRadius : CGFloat = 15
    var lineWidth : CGFloat = 4
    
    
    var shapeName : ShapeName
    var shading : Shadings
    var color : Color
    var count : Int
    var isSelected : Bool
       
    
    
    init(setCard: SetGame<Color, ShapeName, Shadings>.SetCard) {
        self.shapeName = setCard.shapeName
        self.shading = setCard.shading
        self.color = setCard.color
        if setCard.count > 3 || setCard.count < 1{
            self.count = 1
        }else {
            self.count = setCard.count
        }
        self.isSelected = setCard.isSelected
    }
    
    var body: some View {
        getContent(shapeName: shapeName, shading: shading, color: color, count: count)
    }
    
    
    @ViewBuilder
    func getContent(shapeName: ShapeName, shading: Shadings, color: Color, count: Int) -> some View {
        
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isSelected ? Color.orange : Color.gray, lineWidth: lineWidth)
        VStack {
            ForEach(0..<count) { _ in
                self.getShapes()
            }
        }
       
        }
        
    
    
    }
@ViewBuilder
    func getShapes() -> some View {
    
    
    GeometryReader { geometry in
    ZStack {
        
                // MARK: ShapeName
                
            if self.shapeName == ShapeName.Capsule {
                    Rectangle()
                        .opacity(0)
                    // MARK: Capsule Shadings
                if self.shading == Shadings.fill {
                    
                        Capsule().fill(self.color)
                    
                            .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                    
                    
                }else if self.shading == Shadings.stroked {
                    Capsule().stroke(self.color, lineWidth: self.lineWidth)
                        
                        .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                }
                
                
                else {
                    Capsule().stroke(self.color, lineWidth: self.lineWidth)
                        
                        .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                        Capsule()
                            
                            .fill(self.color)
                            .mask(MaskingRect().stroke(self.color, lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                    }
                    
                        
                    
            }else if self.shapeName == ShapeName.Square  {
                    // MARK: Square Shadings
                Rectangle()
                    .opacity(0)
                    
                if self.shading == Shadings.fill {
                        
                        Rectangle()
                            .fill(self.color)
                                
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        
                    }
                else if self.shading == Shadings.stroked {
                        Rectangle()
                            .stroke(self.color, lineWidth: self.lineWidth)
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }else {
                      
                    Rectangle().stroke(self.color, lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        Rectangle()
                            .fill(self.color)
                            .mask(MaskingRect().stroke(self.color, lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }
                    
                    
                }else {
                    // MARK: Circle Shadings
                Rectangle()
                .opacity(0)
                if self.shading == Shadings.fill {
                        
                    Circle().fill(self.color)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    
                    
                }else if self.shading == Shadings.stroked {
                    
                    Circle().stroke(self.color, lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }else {
                    Circle().stroke(self.color, lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        Circle()
                            .fill(self.color)
                            .mask(MaskingRect().stroke(self.color, lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }
                }
                    
                
            }
    
        }
    }
        
}



