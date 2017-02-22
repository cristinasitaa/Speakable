//
//  SPDonationsViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPDonationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userPicImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var donations : [SPUserDonation]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userPicImageView.layer.cornerRadius = self.userPicImageView.frame.size.height / 2
        self.tableView.register(UINib(nibName: "SPDonationTableViewCell", bundle: nil), forCellReuseIdentifier: "SPDonationTableViewCell")
        self.tableView.estimatedRowHeight = 166
        
        self.donations = [SPUserDonation]()
     
        let donation1 = SPUserDonation()
        let campaign = SPCampaign()
        campaign.logo = "campaignLogo2"
        campaign.title = "Education"
        campaign.campaignDescription = "The Ashley Hardaway Theriot Study Abroad Scholarship"
        donation1.campaign = campaign
        self.donations.append(donation1)
        
        let donation2 = SPUserDonation()
        let campaign1 = SPCampaign()
        campaign1.title = "Poverty"
        campaign1.campaignDescription = "Boat People: Past and Present (A Fundraiser for the Crisis in Syria)"
        campaign1.logo = "campaignLogo1"
        donation2.campaign = campaign1
        self.donations.append(donation2)
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.donations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SPDonationTableViewCell", for: indexPath) as! SPDonationTableViewCell
        cell.donation = self.donations[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

}
