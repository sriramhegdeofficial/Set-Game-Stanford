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
    var color : ColorValue
    var count : Int
    var isSelected : Bool
    private var isMatched : Bool = false
    
    @State var appear : Bool = false
    
    @State var disappear : Bool = false
    
    func generateRandomNumberForOffset(uValue: Int, lValue: Int) -> CGFloat {
          
        let result = Int(arc4random_uniform(UInt32(uValue - lValue + 1))) +   lValue
        return CGFloat(result)
      }
    
    
    init(setCard: SetGame.SetCard) {
        self.shapeName = setCard.shapeName
        self.shading = setCard.shading
        self.color = setCard.color
        if setCard.count > 3 || setCard.count < 1{
            self.count = 1
        }else {
            self.count = setCard.count
        }
        self.isSelected = setCard.isSelected
        self.isMatched = setCard.isMatched
        
    }
    
    
    
    var body: some View {
       
            Group {
                    if !isMatched {
                        ZStack {
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(isSelected ? Color.black : Color.gray, lineWidth: lineWidth)
                                VStack {
                                        ForEach(0..<count) { _ in
                                            self.getShapes(color: self.color)                                    }
                                        }
                                                                                                   
                                }
                                
                                .padding(5)
                                .scaleEffect(isSelected ? 1.07 : 1)
                                .offset(x: self.appear ? 0 : generateRandomNumberForOffset(uValue: 300, lValue: -300),
                                        y: self.appear ? 0 : generateRandomNumberForOffset(uValue: 300, lValue: -300))
                                        .offset(x: self.disappear ?  generateRandomNumberForOffset(uValue: 300, lValue: -300) : 0,
                                                y: self.disappear ? generateRandomNumberForOffset(uValue: 300, lValue: -300) : 0)
                                .onAppear{
                                    withAnimation(.easeOut(duration: 5)) {
                                        self.appear = true
                                    }
                                }
                                
                        .onDisappear{
                            print("disappear running ")
                            withAnimation(.easeOut(duration: 5)) {
                                self.disappear = true
                            }
                        }
                                                                                                
                                                                                                
                        }
                                                    
                }
         
        
        
               
                   
         
        
    }
    
    
    
    
        
    
    
    

    func getShapes(color: ColorValue) -> some View {
    
        func getCurrentColor(colorValue: ColorValue) -> Color {
            if colorValue == ColorValue.red {
                return Color.red
            }else if colorValue == ColorValue.blue {
                return Color.blue
            }else {
                return Color.green
            }
        }
    
    return GeometryReader { geometry in
    ZStack {
        
                // MARK: ShapeName
                
            if self.shapeName == ShapeName.Capsule {
                    Rectangle()
                        .opacity(0)
                    // MARK: Capsule Shadings
                if self.shading == Shadings.fill {
                    
                        Capsule().fill(getCurrentColor(colorValue: color))
                    
                            .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                    
                    
                }else if self.shading == Shadings.stroked {
                    Capsule().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                        
                        .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                }
                
                
                else {
                    Capsule().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                        
                        .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                        Capsule()
                            
                            .fill(getCurrentColor(colorValue: color))
                            .mask(MaskingRect().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height)/2)
                    
                    }
                    
                        
                    
            }else if self.shapeName == ShapeName.Square  {
                    // MARK: Square Shadings
                Rectangle()
                    .opacity(0)
                    
                if self.shading == Shadings.fill {
                        
                        Rectangle()
                            .fill(getCurrentColor(colorValue: color))
                                
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        
                    }
                else if self.shading == Shadings.stroked {
                        Rectangle()
                            .stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }else {
                      
                    Rectangle().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        Rectangle()
                            .fill(getCurrentColor(colorValue: color))
                            .mask(MaskingRect().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }
                    
                    
                }else {
                    // MARK: Circle Shadings
                Rectangle()
                .opacity(0)
                if self.shading == Shadings.fill {
                        
                    Circle().fill(getCurrentColor(colorValue: color))
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    
                    
                }else if self.shading == Shadings.stroked {
                    
                    Circle().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }else {
                    Circle().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        Circle()
                            .fill(getCurrentColor(colorValue: color))
                            .mask(MaskingRect().stroke(getCurrentColor(colorValue: color), lineWidth: self.lineWidth))
                            .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                    }
                }
                    
                
            }
    
        }
    }
        
}



