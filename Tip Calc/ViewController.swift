//
//  ViewController.swift
//  Tip Calc
//
//  Created by Dominick Hera on 1/5/16.
//  Copyright © 2016 Posa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipChoice: UISegmentedControl!
    @IBOutlet var pickerWheel: UIPickerView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var tipField: UILabel!
    @IBOutlet var peopleCountField: UITextField!
    @IBOutlet var costPerPersonLabel: UILabel!
    
    var answer: Double = 0
    var realTip: Double = 0
    var realAnswer: Double = 0
    var costPerson: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func tipSegmentChanged(sender: AnyObject) {
        switch (tipChoice.selectedSegmentIndex) {
        case 0:
            tipField.text = ("14")
            break
        case 1:
            tipField.text = ("15")
            break
            
        case 2:
            tipField.text = ("16")
            break
        case 3:
            tipField.text = ("17")
            break
        case 4:
            let alert = SCLAlertView()
            let txt = alert.addTextField("Custom tip value")
            alert.addButton("Done") {
                self.tipField.text = txt.text
            }
            alert.showCloseButton = false
            alert.showEdit("Custom Tip Value", subTitle: "Enter your own custom tip value.")
            break
            
        default:
            print("unknown")
        }
        
    }
    @IBAction func mainButton(sender: AnyObject) {
        let num:Double? = Double(textField.text!)
        let tip:Double? = Double(tipField.text!)
        let split:Double? = Double(peopleCountField.text!)
        
        tipField.text = ("\(tip)%")
        realTip = ((tip! / 100) + 1)
        answer = (num! * realTip)
        costPerson = (answer/split!)
        
        tipField.text = ("\(tip)%")
        costPerPersonLabel.text = (String(costPerson))
        textLabel.text = (String(answer))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



