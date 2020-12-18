//
//  ViewControllerMath.swift
//  SemesterOneFinalChazJaiden
//
//  Created by Tiger Coder on 12/16/20.
//  Copyright © 2020 clc.handley. All rights reserved.
//

import UIKit

class ViewControllerMath: UIViewController {

    
    @IBOutlet weak var ptsOutlet: UILabel!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var opOne: UIButton!
    @IBOutlet weak var opTwo: UIButton!
    @IBOutlet weak var opThree: UIButton!
    var pts : PointsFile!
    var ct = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ptsOutlet.text = "\(pts.totalPoints)pts"
        proceedBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func incorrectOne(_ sender: UIButton) {
        ct = false
        ptsOutlet.text = "\(pts.totalPoints)pts"
    }
    @IBAction func incorrectTwo(_ sender: UIButton) {
        ct = false
        ptsOutlet.text = "\(pts.totalPoints)pts"
    }
    @IBAction func incorrectThree(_ sender: UIButton) {
        ct = false
        ptsOutlet.text = "\(pts.totalPoints)pts"
    }
 
    @IBAction func correctAns(_ sender: UIButton) {
        if(ct){
            pts.changePts(s: 20, b: true)
        }
        else{
            pts.changePts(s: 3, b: false)
        }
        ptsOutlet.text = "\(pts.totalPoints)pts"
        proceedBtn.isHidden = false
        opOne.isHidden = true
        opTwo.isHidden = true
        opThree.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerCodeLock
        nvc.pts = pts
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
