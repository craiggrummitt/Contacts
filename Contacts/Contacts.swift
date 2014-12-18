//
//  Contacts.swift
//  Contacts
//
//  Created by Thinkful on 17/12/2014.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

class Contacts: UITableViewController, ContactInputDelegate {
    
    struct ContactInfo {
        var name: String
        var phoneNumber: String
    }
    
    //Sample contacts
    var firstContact = ContactInfo(name: "John Coffey" , phoneNumber: "(111) 111-1111")
    var secondContact = ContactInfo(name: "Cathy Kane" , phoneNumber: "(222) 222-2222")
    
    var listOfContacts: [ContactInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        listOfContacts.append(firstContact)
        listOfContacts.append(secondContact)
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfContacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = listOfContacts[indexPath.row].name
        cell.detailTextLabel!.text = listOfContacts[indexPath.row].phoneNumber
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            listOfContacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let fromContact = listOfContacts[sourceIndexPath.row]
        listOfContacts.removeAtIndex(sourceIndexPath.row)
        listOfContacts.insert(fromContact, atIndex: destinationIndexPath.row)
    }
    
    // MARK: - ContactInputDelegate protocol
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String) {
        
        var newContact = ContactInfo(name: aName, phoneNumber: aPhoneNumber)
        listOfContacts.append(newContact)
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    //Passing details to detail View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToDetail" {
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            let theSelectedRow = listOfContacts[indexPath!.row]
            let theDestination = (segue.destinationViewController as ContactDetails)
            
            theDestination.contactName = theSelectedRow.name
            theDestination.contactPhone = theSelectedRow.phoneNumber
        } else if segue.identifier == "ToInput" {
            (segue.destinationViewController as ContactInput).delegate = self
            
        }
    }
}
