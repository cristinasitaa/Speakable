//
//  SPDonation.swift
//  Speakable
//
//  Created by Admin on 2/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class SPDonation : NSObject {
    
    var donationId = 0
    var alreadyCollectedAmount = 0
    var counter = 0
    var donationDescription = ""
    var donationsCount = 0
    var donationName = ""
    var noOfDaysLeft = 0
    var donationOrder = 0
    var pledgeAmount = 0
    
    convenience init(dict: [String: AnyObject]) {
        self.init()
        
        if let id = dict["id"]?.int64Value {
            self.donationId = Int(id)
        }
        
        if let alreadyCollectedAmount = dict["alreadyCollectedAmount"]?.int64Value {
            self.alreadyCollectedAmount = Int(alreadyCollectedAmount)
        }
        
        if let counter = dict["counter"]?.int64Value {
            self.counter = Int(counter)
        }
        
        if let donationDectription = dict["description"] as? String {
            self.donationDescription = donationDectription
        }
        
        if let donationsCount = dict["donationsCount"]?.int64Value {
            self.donationsCount = Int(donationsCount)
        }
        
        if let donationName = dict["name"] as? String {
            self.donationName = donationName
        }
        
        if let noOfDaysLeft = dict["noOfDaysLeft"]?.int64Value {
            self.noOfDaysLeft = Int(noOfDaysLeft)
        }
        
        if let donationOrder = dict["donationOrder"]?.int64Value {
            self.donationOrder = Int(donationOrder)
        }
        
        if let pledgeAmount = dict["pledgeAmount"]?.int64Value {
            self.pledgeAmount = Int(pledgeAmount)
        }
    }
}
