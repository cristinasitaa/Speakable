//
//  SPFeedViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstScrollView: UIScrollView!
    @IBOutlet weak var secondScrollView: UIScrollView!
    
    var campaigns : [SPCampaign]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CampaignTableViewCell", bundle: nil), forCellReuseIdentifier: "CampaignTableViewCell")
        self.tableView.estimatedRowHeight = 127
        
       // self.firstScrollView.contentSize = CGSize(width: 1, height: 714) //CGSizeMake(1, 714);
      //  self.secondScrollView.contentSize = CGSizeMake(1, self.scrollview.frame.size.height * number_of_items);


        
        self.campaigns = [SPCampaign]()
        SPWebServiceManager.sharedInstance.getLatestCampaigns({(response) in
            if (response.result.isSuccess) {
                print(response)
                self.parseCampaigns(response: response.result.value as! NSArray)
            }
        })
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.campaigns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CampaignTableViewCell", for: indexPath) as! CampaignTableViewCell
        cell.campaign = self.campaigns[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.tableView.deselectRow(at: indexPath, animated: true)
        
        let campaignDetailViewController = SPCampaignDetailViewController(nibName: "SPCampaignDetailViewController", bundle: nil)
        campaignDetailViewController.campaign = self.campaigns[indexPath.row]
        self.navigationController?.pushViewController(campaignDetailViewController, animated: true)
    }
    
    func parseCampaigns(response: NSArray) {
        for campaignDict in response {
            let campaign = SPCampaign(dict: campaignDict as! [String : AnyObject])
            self.campaigns.append(campaign)
        }
        self.tableView.reloadData()
    }

}
