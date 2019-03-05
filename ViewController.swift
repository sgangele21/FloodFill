//
//  ViewController.swift
//  FloodFill
//
//  Created by Sahil Gangele on 10/30/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var grid: Grid!
    
    var screenWidth: CGFloat {
        return self.view.frame.width
    }
    
    var screenHeight: CGFloat {
        return self.view.frame.height
    }
    
    let numOfRows: CGFloat = 20.0
    let numOfCols: CGFloat = 10.0
    
    var boxWidth: CGFloat {
        return screenWidth / numOfCols
    }
    
    var boxHeight: CGFloat {
        return screenHeight / numOfRows
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.grid = Grid(frame: self.view.bounds, numOfRows: Int(numOfRows), numOfCols: Int(numOfCols))
        self.view.addSubview(grid)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        grid.translatesAutoresizingMaskIntoConstraints = false
        
        grid.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        grid.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        grid.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        grid.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        
        grid.drawCells()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didPan))
        self.grid.addGestureRecognizer(gesture)
        
    }
    
    @objc func didPan(sender: UIGestureRecognizer) {
        
        let point = sender.location(in: self.grid)
        let col = Int(point.x / self.boxWidth)
        let row = Int(point.y / self.boxHeight)
        
        print("\(point): \(row),\(col)")
        
        floodFill(cells: self.grid.cells, i: row, j: col)
    }
    
    var iterations = 0
    func floodFill(cells: [String : Cell], i: Int, j: Int) {
        iterations += 1
        var currIterations = iterations
        let key = "\(i),\(j)"
        
        if cells[key] == nil {
            return
        } else if cells[key]!.visited {
            return
        }
        cells[key]?.backgroundColor = UIColor.white
        cells[key]?.visited = true
        // Look Up
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.floodFill(cells: cells, i: i + 1, j: j)
        }
        // Look Down
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.floodFill(cells: cells, i: i - 1, j: j)
        }
        // Look Left
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.floodFill(cells: cells, i: i, j: j - 1)
        }
        // Look Right
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.floodFill(cells: cells, i: i, j: j + 1)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

