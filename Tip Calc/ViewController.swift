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
    @IBAction func tipSegmentChanged(sender: AnyObject) {
        switch (tipChoice.selectedSegmentIndex) {
        case 0:
            print("first")
            tipField.text = ("14")
            break
        case 1:
            print("second")
            tipField.text = ("15")
            break
            
        case 2:
            print("third")
            tipField.text = ("16")
            break
        case 3:
            print("fourth")
            tipField.text = ("17")
            break
        case 4:
            print("fifth")
           
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
        
        costPerPersonLabel.text = (String(costPerson))
        textLabel.text = (String(answer))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



