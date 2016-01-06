//
//  ViewController.swift
//  Tip Calc
//
//  Created by Dominick Hera on 1/5/16.
//  Copyright © 2016 Posa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

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
    let pickerData = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerWheel.delegate = self
        pickerWheel.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipField.text = pickerData[row]
        // let tip:Int? = Int(pickerData[row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



