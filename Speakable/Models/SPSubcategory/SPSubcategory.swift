//
//  SPSubcategory.swift
//  Speakable
//
//  Created by Admin on 2/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class SPSubcategory : NSObject {
    
    var subcategoryID = 0
    var subcategoryName = ""
    
    convenience init(dict: [String: AnyObject]) {
        self.init()
        
        if let id = dict["id"]?.int64Value {
            self.subcategoryID = Int(id)
        }
        
        if let subcategoryName = dict["name"] as? String {
            self.subcategoryName = subcategoryName
        }
        
    }
}
