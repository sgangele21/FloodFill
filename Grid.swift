//
//  Grid.swift
//  FloodFill
//
//  Created by Sahil Gangele on 10/30/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class Cell: UIView {
    
    var visited: Bool = false
    
}

public class Grid: UIView {
    
    var numOfRows: Int = 0
    var numOfCols: Int = 0
    
    var cellHeight: CGFloat = 0.0
    var cellWidth : CGFloat = 0.0
    
    var cells: [String : Cell] = [:]
    
    public init(frame: CGRect, numOfRows: Int, numOfCols: Int) {
        super.init(frame: frame)
        
        self.numOfRows = numOfRows
        self.numOfCols = numOfCols
        
        self.cellHeight = frame.height / CGFloat(numOfRows)
        self.cellWidth  = frame.width  / CGFloat(numOfCols)
        
    }
    
    public func drawCells() {
        for i in 0..<self.numOfRows {
            for j in 0..<self.numOfCols  {
                let view = Cell(frame: CGRect(x: self.cellWidth * CGFloat(j), y: self.cellHeight * CGFloat(i), width: self.cellWidth, height: self.cellHeight))
                cells["\(i),\(j)"] = view
                view.layer.borderWidth = 1.0
                view.layer.borderColor = UIColor.black.cgColor
                view.backgroundColor = UIColor.red
                DispatchQueue.main.async {
                    self.addSubview(view)
                }
            }
            
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
