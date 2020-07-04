//
//  GridLayout.swift
//  Set Game
//
//  Created by sriram on 01/07/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

struct GridLayout {
    
    private var size : CGSize
    private var rowCount: Int = 0
    private var columnCount: Int = 0
    private var desiredAspectRatio : Double = 2/3
    
    private var itemCount = 12
    
   
    
    
    init(size: CGSize) {
        self.size = size
        if size.width == 0 || size.height == 0 {
            return
        }
        
        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount)
        var smallestVariance: Double?
        let sizeAspectRatio = Double(self.size.width/self.size.height)
        
        for rows in 1...itemCount {
            for columns in 1...itemCount {
                if rows * columns >= itemCount {
                    let itemAspectRatio = sizeAspectRatio * Double(rows/columns)
                    let variance = abs(itemAspectRatio - desiredAspectRatio)
                    if smallestVariance == nil || variance < smallestVariance! {
                        smallestVariance = variance
                        bestLayout = (rowCount: rows, columnCount: columns)
                    }
                }
            }
        }
        
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
        
        
    }
    
    var itemSize: CGSize {
           if rowCount == 0 || columnCount == 0 {
               return CGSize.zero
           } else {
               return CGSize(
                   width: size.width / CGFloat(columnCount),
                   height: size.height / CGFloat(rowCount)
               )
           }
       }
    
    
    func location(ofItemAt index: Int) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return CGPoint.zero
        } else {
            return CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * itemSize.width,
                y: (CGFloat(index / columnCount) + 0.5) * itemSize.height
            )
        }
    }
    
   
}


