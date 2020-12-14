//
//  PointsFile.swift
//  SemesterOneFinalChazJaiden
//
//  Created by Tiger Coder on 12/12/20.
//  Copyright © 2020 clc.handley. All rights reserved.
//

import Foundation

class PointsFile{
    var totalPoints = 0
    
    init(p : Int) {
        totalPoints = p
    }
    
    func changePts(s : Int, b : Bool) -> Void {
        if b {
            totalPoints+=s
        } else {
            totalPoints-=s
        }
    }
    
    
}
