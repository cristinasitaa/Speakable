//
//  SPDonationTableViewCell.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPDonationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var campaignLogoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountDonated: UILabel!
    @IBOutlet weak var donorsLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    
    var donation: SPUserDonation {
        set {
            self.campaignLogoImageView.image = UIImage(named:newValue.campaign.logo)
            self.descriptionLabel.text = newValue.campaign.campaignDescription
            self.categoryLabel.text = newValue.campaign.title
            self.amountDonated.text = String(arc4random_uniform(500))
            self.donorsLabel.text = String(arc4random_uniform(40))
            self.goalLabel.text = String(arc4random_uniform(3000))
        }
        get {
            return self.donation
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

