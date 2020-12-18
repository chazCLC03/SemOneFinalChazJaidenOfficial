//
//  ViewControllerFinal.swift
//  SemesterOneFinalChazJaiden
//
//  Created by Tiger Coder on 12/17/20.
//  Copyright © 2020 clc.handley. All rights reserved.
//

import UIKit



class ViewControllerFinal: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    var pts : PointsFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOutlet.text = "Congratulations! You got the key and made it out. You got \(pts.totalPoints) points!"
        //pointlabel.text = "\(PointsFile.totalPoints)"
        // Do any additional setup after loading the view.

    }

   
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindSeg", sender: self)
    }
            //set vc to first one
        //PointsFile.totalPoints = 500
    

}

