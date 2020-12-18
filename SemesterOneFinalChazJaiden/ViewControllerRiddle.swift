//  Created by Tiger Coder on 12/15/20.

//  Copyright © 2020 clc.handley. All rights reserved.

//



import UIKit



class ViewControllerRiddle: UIViewController {

// will use one text field with a centralized label that will change based on the riddle preset

    //textfield will accept a specific string without caps

    //typing "skip" will allow the player to skip a riddle until the last one

    //label reminding one word answers and lowercase

    //alertcontroller if this isn't applicable

    

    

     

     

     

     
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var ptsOutlet: UILabel!
    
    var pts : PointsFile!
    var riddle0 = ["What belongs to you, but other people use it more than you?", "name","address","nickname"]
    var riddle1 = [" I have two hands, but I can not scratch myself. What am I?","clock","timepiece","timer"]
    var riddle2 = ["I can be cracked, I can be made. I can be told. What am I?","joke","pun","jest"]
    var riddle3 = ["What can you catch but not throw?","cold"]
    var i = 0
    var riddles : [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = riddle0[0]
        proceedBtn.isHidden = true
        ptsOutlet.text = "\(pts.totalPoints)pts"
        // Do any additional setup after loading the view.
        riddles = [riddle0,riddle1,riddle2,riddle3]

    }

    func correspondence(textFieldInput: String) -> Bool{
        let o = textFieldInput.lowercased()
        let riddle = riddles[i]
        var ct = 0
        for guess in riddle {
            if (o == String(guess)) {
                pts.changePts(s : 20 , b : true)
                ct+=1
            } else {
                if o == "skip" {
                     pts.changePts(s : 3 , b : true)
                }
            }
        }
        if (ct == 1) {
            i+=1
            skip()
            return true
        }

        pts.changePts(s : 5 , b : false)
        i+=1
        skip()
        return false
    }

    func skip() -> Void {
        if i <= 3{
            mainLabel.text = String(riddles[i][0])
        }
        
    }

    func check() -> Bool{
        if i > 3{
            //checkButton.setTitle("Proceed", for: .normal)
            checkButton.isHidden = true
            proceedBtn.isHidden = false
            return true
        }
        return false
    }
    
    
    
    @IBAction func checkFunc(_ sender: UIButton) {
        if check(){
            check()
            ptsOutlet.text = "\(pts.totalPoints)pts"
        }
        else{
            correspondence(textFieldInput: textfield.text!)
            ptsOutlet.text = "\(pts.totalPoints)pts"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerMath
        nvc.pts = pts
    }
}
