//

//  ViewControllerCodeLock.swift

//  SemesterOneFinalChazJaiden

//

//  Created by Tiger Coder on 12/15/20.

//  Copyright © 2020 clc.handley. All rights reserved.

//

/*REQUIREMENTS

//   main display label

 uitextfield

 check button

 reset number btn--new number will be displayed

 THE NUMBER WILL BE DISPLAYED WHEN RESET BTN IS HIT

 PLEASE INSTRUCT USERS TO DO SO

 */

import UIKit



class ViewControllerCodeLock: UIViewController {

    @IBOutlet weak var ptsOutlet: UILabel!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var uitextfield: UITextField!
    var code = 1
    var popup:UIView!
    var pts : PointsFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedBtn.isHidden = true
        ptsOutlet.text = "\(pts.totalPoints)pts"
        // Do any additional setup after loading the view.

    }

    
    @IBAction func resetBtn(_ sender: UIButton) {
        redo()
        showAlert()
        ptsOutlet.text = "\(pts.totalPoints)pts"
    }
    
    
     
    @IBAction func checkAnsBtn(_ sender: UIButton) {
        buttonclick()
        ptsOutlet.text = "\(pts.totalPoints)pts"
    }
    
    func showAlert() {
      //customize view
      popup = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        popup.backgroundColor = UIColor.white
        let lb = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        lb.font = UIFont.systemFont(ofSize: 30.0)
        lb.text = "\(code)"

      // show on screen
      self.view.addSubview(popup)
      popup.addSubview(lb)

      // set the timer
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)

    }

    @objc func dismissAlert(){
      if popup != nil {
        // Dismiss the view from here
        popup.removeFromSuperview()
      }
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

    func wrongAnswer(input: String) -> Void {
               let alert = UIAlertController(title: "You answer was incorrect", message: "Please try again.", preferredStyle: .alert)

               alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))

               self.present(alert, animated: true)

                  //answerLabel.text = "Input values are not numeric"

               //UIalertcontroller
       }

    func redo(){
        code = Int.random(in: 1..<100000)
    }

    func buttonclick(){
            if(checkAnswer(input: uitextfield.text!)){
                if(Int(uitextfield.text!) == code){
                    proceedBtn.isHidden = false
                    pts.changePts(s: 15, b: true)
                }else{
                    wrongAnswer(input: uitextfield.text!)
                    pts.changePts(s: 3, b: false)
                    }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerSudoku
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

