//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Jose Quintero on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    private let tempTranformation: TemperatureTransformation = TemperatureTransformation()
    private let stringTranformation: IntStringTransformation = IntStringTransformation()
    
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var fTextField: UITextField!
    
    @IBAction func onChange(sender: UITextField) {
        print("abc")
        switch sender {
        case cTextField:
            fTextField.text = tempTranformation
                .tranform(
                    value: stringTranformation.tranform(
                        value: cTextField.text ?? "0"
                    )
                )
                .description
        default:
            cTextField.text = tempTranformation
                .invertTranform(
                    value: stringTranformation.tranform(
                        value: fTextField.text ?? "0"
                    )
                )
                .description
        }
    }
    
}

