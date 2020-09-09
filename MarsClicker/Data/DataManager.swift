//
//  DataManager.swift
//  MarsClicker
//
//  Created by Aidan Blant on 9/8/20.
//  Copyright © 2020 Aidan Blant. All rights reserved.
//

import Foundation



class DataManager {
    
    static var tick : Int = 0
    static var soil : Float = 0.0
    
    public func startUpdating(){
        var timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    @objc public func update(){
        print("tick: \(DataManager.tick)")
        DataManager.tick += 1
        DataManager.soil += 0.5
    }
    
    func thisFuncCalled(){
    }

}
