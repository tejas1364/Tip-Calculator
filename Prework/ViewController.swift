//  ViewController.swift
//  Prework
//
//  Created by Tejas Marimuthu on 1/10/21.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Updates when slider value is changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //Gets slider percent value from slider
        let currentSliderValue = Int(sender.value)
        
        //Updates the percentage label amount
        tipPercentLabel.text = "\(currentSliderValue)%"
    }
    
    //Removes selected value in tip control when slider is dragged
    @IBAction func sliderDragged(_ sender: UISlider) {
        tipControl.selectedSegmentIndex = -1
    }
    
    
    //Updates percent label when segment control is selected by user
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        let tipControlPercentages = [15, 18, 20]
        let tipPercent = tipControlPercentages[sender.selectedSegmentIndex]
        tipSlider.setValue(Float(tipPercent), animated: true)
        tipPercentLabel.text = String(tipPercent) + "%"
    }
    
    //Formats money into currency based on device's location
    func convertDoubleToCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Gets bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Gets Total tip by multiplying tip * tipPercentage
        let tipPercentage = Double(Int(tipSlider.value)) / 100.0
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        //Updates Tip Amount Label
        tipAmountLabel.text = convertDoubleToCurrency(amount: tip)
        //Updates Total Amount
        totalLabel.text = convertDoubleToCurrency(amount: total)
        
    }
}

