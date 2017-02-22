//
//  SPCategory.swift
//  Speakable
//
//  Created by Admin on 2/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class SPCategory : NSObject {
    
    var categoryID = 0
    var categoryName = ""
    var subcategories = [SPSubcategory]()
    
    convenience init(dict: [String: AnyObject]) {
        self.init()
        
        if let id = dict["id"]?.int64Value {
            self.categoryID = Int(id)
        }
        
        if let categoryName = dict["name"] as? String {
            self.categoryName = categoryName
        }
        
        if let subIssuesArray = dict["subIssues"] as? [AnyObject] {
            for issueDict in subIssuesArray {
                if ((issueDict as? [String: AnyObject]) != nil) {
                    let subcategory = SPSubcategory(dict: issueDict as! [String: AnyObject])
                    self.subcategories.append(subcategory)
                }
            }
        }
        
    }
}
