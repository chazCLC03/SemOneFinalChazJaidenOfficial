//
//  ViewController.swift
//  SemesterOneFinalChazJaiden
//
//  Created by Tiger Coder on 12/7/20.
//  Copyright © 2020 clc.handley. All rights reserved.
//

import UIKit



class ViewController: UIViewController {



    

   

    var pts = PointsFile(p: 500)

    static var timer : Timer?

    override func viewDidLoad() {

        super.viewDidLoad()

        ViewController.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.

        //comment one

    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerRiddle
        nvc.pts = pts
    }

    
    
    

    @objc func fireTimer() {

          pts.changePts(s : 1, b : false)

         }
    
    @IBAction func startBtn(_ sender: UIButton) {
        
    }
    

    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }


}


