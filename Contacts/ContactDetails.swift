//
//  ContactDetails.swift
//  Contacts
//
//  Created by Craig on 17/12/2014.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    
    var contactName = ""
    var contactPhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactNameLabel.text = contactName
        contactPhoneLabel.text = contactPhone
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
