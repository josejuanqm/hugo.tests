//
//  ViewController.swift
//  Counter
//
//  Created by Jose Quintero on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    let counter: Counter = Counter()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func step() {
        counter.advance()
        textField.text = counter.value.description
    }

}

