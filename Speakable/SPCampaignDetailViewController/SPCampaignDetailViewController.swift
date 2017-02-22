//
//  SPCampaignDetailViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPCampaignDetailViewController : UIViewController {
    
    @IBOutlet weak var numberOfDaysLeftLabel: UILabel!
    
    @IBOutlet weak var campaignImageView: UIImageView!

    @IBOutlet weak var campaignTitle: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var campaignTitleLabel: UILabel!
    
    @IBOutlet weak var campaignDescriptionLabel: UILabel!
    
    
    var campaign : SPCampaign!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tabBarController?.tabBar.isHidden = true
        self.numberOfDaysLeftLabel.text = String(self.campaign.donation.noOfDaysLeft)
        let url = URL(string: self.campaign.logo)
        let data = try? Data(contentsOf: url!)
        self.campaignImageView.image = UIImage(data: data!)
        self.campaignTitle.text = self.campaign.donation.donationName
        self.subtitleLabel.text = self.campaign.donation.donationDescription
        self.campaignTitleLabel.text = self.campaign.title
        self.campaignDescriptionLabel.text = self.campaign.campaignDescription
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func backButtonAction(_ sender: Any) {
         _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func takeAction(_ sender: Any) {
        let takeActionViewController = SPTakeActionViewController(nibName: "SPTakeActionViewController", bundle: nil)
        takeActionViewController.modalPresentationStyle = .overCurrentContext
        present(takeActionViewController, animated: true, completion: nil)
    }
    
}
