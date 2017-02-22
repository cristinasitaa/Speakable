//
//  CampaignTableViewCell.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Kingfisher

class CampaignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var campaignImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var publishedByLabel: UILabel!
    
    var campaign: SPCampaign {
        set {
            self.campaignImageView.image = UIImage(named:newValue.logo)
            self.descriptionLabel.text = newValue.title
            self.categoryLabel.text = newValue.category
            self.publishedByLabel.text = newValue.publishedDate.relativeTime + " by " + newValue.publishedBy
            
            let url = URL(string: newValue.logo)
            self.campaignImageView.kf.setImage(with: url)
            }
        get {
            return self.campaign
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
