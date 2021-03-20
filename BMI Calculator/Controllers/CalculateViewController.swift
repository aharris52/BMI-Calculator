//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // Instantiate a CalculatorBrain
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Takes input from height slider
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = (String(format: "%.2f", sender.value))
        heightLabel.text = "\(height)m"
    }
    
    // Takes input from weight slider
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = (String(format: "%.0f", sender.value))
        weightLable.text = "\(weight)kg"
    }
    
    // Calls the calculateBMI() method from the calculator brain
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(heightSlider.value)
        print(weightSlider.value)
        // Grap UISlider values
        let height = heightSlider.value
        let weight = weightSlider.value
        // calculate the bmi using these values
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            print(calculatorBrain.getBMIValue())
        }
    }
}

