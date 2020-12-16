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

var arBtn : [UIButton]



class ViewControllerSudoku: UIViewController {



    override func viewDidLoad() {

        super.viewDidLoad()

        //highlight midL4 label

        // Do any additional setup after loading the view.

    }

    

    //checkbutton

    /*if(checkAnswer(input: textfield.text) && isCorrect(ans: Int(textField.text), index: i){

     highlight(index: i)

     }

     i+=1

    */

    

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

        arBtn[index+1].backgroundColor = UIColor.red

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

