//
//  ViewController.swift
//  Tip Calc
//
//  Created by Dominick Hera on 1/5/16.
//  Copyright © 2016 Posa. All rights reserved.
//

import UIKit
import Money
import iAd

class ViewController: UIViewController, ADInterstitialAdDelegate {

    @IBOutlet weak var tipChoice: UISegmentedControl!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var tipField: UILabel!
    @IBOutlet var peopleCountField: UITextField!
    @IBOutlet var costPerPersonLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    
    var subTip: Double = 0
    var answer: Double = 0
    var realTip: Double = 0
    var realAnswer: Double = 0
    var costPerson: Double = 0
    var realTipAmount: Double = 0
    var interAd = ADInterstitialAd()
    var interAdView: UIView = UIView()
    let otherCloseButton = UIButton(type: UIButtonType.System)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        //UIViewController.prepareInterstitialAds()
        //peopleCountField.text = "1"
        
        otherCloseButton.frame = CGRectMake(10, 16, 20, 20)
        otherCloseButton.layer.cornerRadius = 10
        otherCloseButton.setTitle("x", forState: .Normal)
        otherCloseButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        otherCloseButton.backgroundColor = UIColor.whiteColor()
        otherCloseButton.layer.borderColor = UIColor.blackColor().CGColor
        otherCloseButton.layer.borderWidth = 1
        otherCloseButton.addTarget(self, action: "close:", forControlEvents: UIControlEvents.TouchDown)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func close(sender: UIButton) {
        otherCloseButton.removeFromSuperview()
        interAdView.removeFromSuperview()
    }
    
    func didTapView(){
        self.view.endEditing(true)
    }
    
    @IBAction func tipSegmentChanged(sender: AnyObject) {
        switch (tipChoice.selectedSegmentIndex) {
        case 0:
            subTip = 10
            //tipField.text = ("10.0%")
            break
        case 1:
            subTip = 15
          //  tipField.text = ("15.0%")
            break
            
        case 2:
            subTip = 16
            //tipField.text = ("16.0%")
            break
        case 3:
            subTip = 20
           // tipField.text = ("20.0%")
            break
        case 4:
            let alert = SCLAlertView()
            let txt = alert.addTextField("Custom tip value")
            alert.addButton("Done") {
                if txt.text == "" {
                    SCLAlertView().showError("No Tip Amount Entered", subTitle: "Your tip amount was set to 10% by default.")
                } else {
                self.subTip = Double(txt.text!)!
                self.tipField.text = ("\(txt.text)%")
                }
            }
            alert.showCloseButton = false
            alert.showEdit("Custom Tip Value", subTitle: "Enter your own custom tip value.")
            break
            
        default:
            print("unknown")
        }
        
    }
    @IBAction func mainButton(sender: UIButton) {
        let num:Double? = Double(textField.text!)
        let split:Double? = Double(peopleCountField.text!)
        
        if num == nil {
           SCLAlertView().showError("No Amount Entered", subTitle: "Please enter a meal cost.")
        } else if subTip == 0 {
            subTip = 10
        } else if split == nil {
           peopleCountField.text = "1"
        } else {
        realTip = ((subTip / 100) + 1)
        answer = (num! * realTip)
        costPerson = (answer/split!)
        realTipAmount = (num! * (subTip/100))
            
        let realAmount: Money = Money(answer)
        let tipAmountMoney: Money = Money(realTipAmount)
        let costPersonMoney: Money = Money(costPerson)
            
            let alert = SCLAlertView()
            alert.addButton("Done") {
               self.loadAd()
                //self.peopleCountField.text = ""
           //     self.textField.text = ""
            }
            alert.showCloseButton = false
            alert.showSuccess("Meal Information", subTitle: "Tip Percentage: \(NSDecimalNumber(double: subTip))%\nCost per Person: \(costPersonMoney)\nTip Amount: \(tipAmountMoney)\nTotal Cost: \(realAmount)")
  //tipField.text = ("\(subTip)%")
      /*  tipField.text = ("\(subTip)%")
        costPerPersonLabel.text = (String(costPerson))
        textLabel.text = (String(answer))
        tipAmount.text = ("\(realTipAmount)")*/
        }
        
    }
    
    func loadAd() {
        print("load ad")
        interAd = ADInterstitialAd()
        interAd.delegate = self
    }
    
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        print("ad did load")
        
        interAdView = UIView()
        interAdView.frame = self.view.bounds
        view.addSubview(interAdView)
        
        interAd.presentInView(interAdView)
        UIViewController.prepareInterstitialAds()
        
        interAdView.addSubview(otherCloseButton)
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        print("failed to receive")
        print(error.localizedDescription)
        
        otherCloseButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



