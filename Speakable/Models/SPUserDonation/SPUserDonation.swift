//
//  SPUserDonation.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class SPUserDonation: NSObject {
    
    dynamic var id = ""
    dynamic var donatedAmountByUser = 0
    dynamic var campaign = SPCampaign()
    
    
    
    convenience init(dict: [String: AnyObject]) {
        self.init()
        
        //        if let articleTitle = dict["Title"] as? String {
        //            self.title = articleTitle
        //        }
        
    }
    
}
