//

//  ViewControllerSudoku.swift

//  SemesterOneFinalChazJaiden

//

//  Created by Tiger Coder on 12/15/20.

//  Copyright © 2020 clc.handley. All rights reserved.

//

//will display a completed sudoku problem with labels that willbe hidden when player picks correct answer

//need to clarify that a single number is the only accepted value

//point detriment for wrong answer + uialert controller

import UIKit

//titles should be btn0,btn1,btn2 etc..

//coversmidL4

//covers mid2

//covers mid 5

//covers mid 7

//covers bot mid 4

//checkanswerbtn

//uitextfield

var answers = [4,2,5,7,4]

var i = 0

var pts : PointsFile!


class ViewControllerSudoku: UIViewController {


    @IBOutlet weak var ptsOutlet: UILabel!
    var pts : PointsFile!
    @IBOutlet weak var proceedBtn: UIButton!
    
    
    @IBOutlet weak var midTwo: UILabel!
    @IBOutlet weak var midSeven: UILabel!
    @IBOutlet weak var midFive: UILabel!
    @IBOutlet weak var lowMidFour: UILabel!
    @IBOutlet weak var leftMidFour: UILabel!
    
    var arBtn : [UILabel]!
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ptsOutlet.text = "\(pts.totalPoints)pts"
        arBtn = [leftMidFour,midTwo,midFive,midSeven,lowMidFour]
        highlight(index: -1)
        proceedBtn.isHidden = true
        // Do any additional setup after loading the view.

    }

    

    //checkbutton
    @IBAction func checkButton(_ sender: UIButton) {
        if checkAnswer(input: textfield.text!) && isCorrect(ans: Int(textfield.text!)!, index: i){
        highlight(index: i)
        i += 1
        }
        ptsOutlet.text = "\(pts.totalPoints)pts"
        
    }
    
    

    

    func checkAnswer(input: String) -> Bool {

         let a = Int(input)

        if (a != nil) {

            return true

           } else {

            let alert = UIAlertController(title: "Input Values are not Numeric", message: "Please input a single Numeric Value.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))

            self.present(alert, animated: true)

               //answerLabel.text = "Input values are not numeric"

            //UIalertcontroller

            return false

           }

        

    }

    func isCorrect(ans : Int, index: Int) -> Bool{

        if(ans == answers[index]){

            arBtn[index].isHidden = true

           return true

        }

        return false

    }

    

    func highlight(index: Int){
        if (i < 4){
            arBtn[index+1].backgroundColor = UIColor.red
        }
        else{
            proceedBtn.isHidden = false
        }
        

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerFinal
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

