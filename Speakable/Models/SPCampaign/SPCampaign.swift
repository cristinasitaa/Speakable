//
//  SPCampaign.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

enum Action : Int {
    case vote
    case sign
    case donate
}


class SPCampaign: NSObject {
    
    var campaignId = 0
    var title = ""
    var publishedDate = Date()
    var publishedBy = ""
    var category = ""
  //  var actions = [SPAction]()
    var logo = ""
  //  dynamic var cdescription = ""
    var campaignDescription = ""
//    dynamic var campaignFullText = ""
//    dynamic var noOfDaysLeft = ""
//    dynamic var donatedAmount = ""
//    dynamic var targetAmount = ""
     var listOfActions : [Action] = []
    var donation : SPDonation!

 
    convenience init(dict: [String: AnyObject]) {
        self.init()
        
        if let campaignId = dict["id"]?.int64Value {
            self.campaignId = Int(campaignId)
            self.logo = API.getCampaignLogo + String(campaignId)
        }
        
        if let title = dict["title"] as? String {
            self.title = title
        }
        
        if let publishedBy = dict["publishedBy"] as? String {
            self.publishedBy = publishedBy
        }
        
        if let category = dict["category"] as? String {
            self.category = category
        }
        
        if let campaignDecription = dict["description"] as? String {
            self.campaignDescription = campaignDecription
        }
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let dateString = dict["publishedDate"] as? String {
            if let formattedDate = formatter.date(from: dateString) {
                self.publishedDate = formattedDate
            }
        }
        
        let actions = dict["actions"] as! [AnyObject]
        for action in actions {
            if ((action["type"] as! String) == "Donation") {
                self.donation = SPDonation(dict: action as! [String : AnyObject])
            }
        }
        
        
    }
    
}
