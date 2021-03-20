//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Andrew Harris on 2/19/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    var advice: String?
    var color: UIColor?
    
    // accessor for bmi
    func getBMIValue() -> String {
        let bmiOneDecPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiOneDecPlace
    }
    
    // Calculates BMI from uislider input
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue =  ((weight) / (height * height))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more cake...", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
            print("Underweight")
        } else if bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "The NIH thinks you're healthy", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            print("Normal")
        } else {
            bmi = BMI(value: bmiValue, advice: "PUT THE CHEETOS DOWN!!!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
            print("Overweight")
        }
    }
    
    // accessor for background color
    // returns a blank screen if there's a problem
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    // accessor for advice
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice, the segue sender shouldn't let you do that"
    }
}
