//
//  SPWebServiceManager.swift
//  Speakable
//
//  Created by Admin on 2/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Alamofire

let mainURL = "https://qa-api.actionbutton.co"

struct API {
  
    static let getCategories  = "\(mainURL)/api/Campaigns/GetCategories"
    static let getLatestCampaigns  = "\(mainURL)/api/Campaigns/GetLatest"
    static let getCampaignLogo = "\(mainURL)/api/Campaigns/GetCampaignLogo/"
  
}

class SPWebServiceManager: NSObject {
    
    static let sharedInstance = SPWebServiceManager()
    
    var alamofireManager : Alamofire.SessionManager
    
    override init () {
        let configuration = URLSessionConfiguration.default
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }

    func getCategories(_ completionHandler: @escaping (DataResponse<Any>) -> Void) {
        self.alamofireManager.request(API.getCategories, method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                completionHandler(response)
            })
    }
    
    func getLatestCampaigns(_ completionHandler: @escaping (DataResponse<Any>) -> Void) {
        self.alamofireManager.request(API.getLatestCampaigns, method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                completionHandler(response)
            })
    }
    
    func getCampaignLogo(campaignId: String, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        self.alamofireManager.request(API.getCampaignLogo, method: .get, parameters: ["id": campaignId] , encoding: URLEncoding.default)
            .responseJSON(completionHandler: { (response) -> Void in
                completionHandler(response)
            })
    }
    

}

