//
//  ContactInput.swift
//  Contacts
//
//  Created by Craig on 17/12/2014.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

protocol ContactInputDelegate {
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}


class ContactInput: UIViewController, UITextFieldDelegate {
    
    //Properties
    var name = ""
    var phoneNumber = ""
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    var delegate: ContactInputDelegate?
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        phoneField.delegate = self
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if name != "" && phoneNumber != "" {
            delegate!.didUpdateContact(self, aName: name, aPhoneNumber: phoneNumber)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextFieldDelegate methods
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        if textField.tag == 1 {
            name = textField.text
        }
        else {
            phoneNumber = textField.text
        }
        println("Name: \(name), Phone: \(phoneNumber)")
        
        return true
    }
}
