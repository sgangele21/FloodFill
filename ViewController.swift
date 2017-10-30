//
//  ViewController.swift
//  FloodFill
//
//  Created by Sahil Gangele on 10/30/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth  = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        let numOfRows: CGFloat = 20.0
        let numOfCols: CGFloat = 10.0
        
        let boxWidth = screenWidth / numOfCols
        let boxHeight = screenHeight / numOfRows
        
        print("Box Weight: \(boxWidth)")
        print("Box Height: \(boxHeight)")
        
        for i in 0..<Int(numOfRows) {
            for j in 0..<Int(numOfCols)  {
                let view = UIView(frame: CGRect(x: boxWidth * CGFloat(j), y: boxHeight * CGFloat(i), width: boxWidth, height: boxHeight))
                view.layer.borderWidth = 1.0
                view.layer.borderColor = UIColor.black.cgColor
                view.backgroundColor = UIColor.red
                
                self.view.addSubview(view)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

