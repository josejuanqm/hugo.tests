//
//  ViewController.swift
//  CRUD
//
//  Created by Jose Quintero on 12/5/20.
//

import UIKit

protocol DetailViewControllerDelegate {
    func create(person: Person)
    func update(person: Person, with: Person.Details)
    func delete(person: Person)
}

class DetailViewController: UIViewController {
    
    var person: Person? = nil
    var tempPerson: Person? = nil
    var delegate: DetailViewControllerDelegate? = nil
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!

    override func viewDidAppear(_ animated: Bool) {
        if let p = person {
            firstNameField.text = p.firstName
            lastNameField.text = p.lastName
            createButton.isEnabled = false
            updateButton.isEnabled = true
            deleteButton.isEnabled = true
            createButton.alpha = 0.5
            updateButton.alpha = 1
            deleteButton.alpha = 1
        } else {
            createButton.isEnabled = true
            updateButton.isEnabled = false
            deleteButton.isEnabled = false
            createButton.alpha = 1
            updateButton.alpha = 0.5
            deleteButton.alpha = 0.5
        }
    }
    
    @IBAction func create() {
        tempPerson = Person(
            firstName: firstNameField.text ?? "",
            lastName: lastNameField.text ?? ""
        )
        delegate?.create(person: tempPerson!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func update() {
        tempPerson = Person(
            firstName: firstNameField.text ?? "",
            lastName: lastNameField.text ?? ""
        )
        delegate?.update(
            person: person!,
            with: (tempPerson?.firstName ?? "", tempPerson?.lastName ?? "")
        )
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func delete() {
        delegate?.delete(person: person!)
        dismiss(animated: true, completion: nil)
    }

}

