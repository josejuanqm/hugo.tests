//
//  ViewController.swift
//  FlightBooker
//
//  Created by Jose Quintero on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    private let dateTranformation: DateTransformation = DateTransformation(format: "dd-mm-yyy")
    private let validator: DateValidator = DateValidator()
    private let types: [FlightType] = [.oneWay, .twoWay]
    private let typeTitleHash: [FlightType: String] = [
        .oneWay: "One way flight",
        .twoWay: "Return flight"
    ]
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var bookButton: UIButton!
    
    @IBAction func book(sender: UIButton) {
        let alert = UIAlertController(title: "Flight Booker", message: "Your flight has been booked!", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dateChanged(sender: UITextField) {
        if (
            !validator
                .validate(
                    value: sender.text ?? "",
                    bound:
                        (sender == startDateTextField ?
                            endDateTextField.text :
                            startDateTextField.text) ?? dateTranformation.invertTranform(value: Date())
                )
        ) {
            sender.backgroundColor = .systemRed
            bookButton.isEnabled = false
            bookButton.alpha = 0.5
        } else {
            sender.backgroundColor = .white
            bookButton.isEnabled = true
            bookButton.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        startDateTextField.text = dateTranformation.invertTranform(value: Date())
        endDateTextField.text = dateTranformation.invertTranform(value: Date())
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = types[row]
        
        switch type {
        case .oneWay:
            endDateTextField.isEnabled = false
            endDateTextField.alpha = 0.5
        default:
            endDateTextField.isEnabled = true
            endDateTextField.alpha = 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let type = types[row]
        return typeTitleHash[type]
    }
    
}
