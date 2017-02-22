//
//  SPTakeActionTableViewCell.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPTakeActionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionImageView: UIImageView!
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var actionDescriptionLabel: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    var action: Action {
        set {
            self.actionButton.layer.borderWidth = 2
            self.actionButton.layer.borderColor = UIColor(red: 0.93, green: 0.10, blue: 0.27, alpha: 1).cgColor
            self.cellContentView.layer.borderWidth = 0.5
            self.cellContentView.layer.borderColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0).cgColor
            switch newValue {
            case .donate:
                self.actionImageView.image = UIImage(named: "Donation")
                self.actionTitle.text = "Make a Donation"
                self.actionDescriptionLabel.text = "Help this cause with your wallet."
                self.actionButton.setTitle("DONATE", for: .normal)
               break
            case .sign:
                self.actionImageView.image = UIImage(named: "Petition")
                self.actionTitle.text = "Sign The Petition"
                self.actionDescriptionLabel.text = "Let your congressman know where you stand"
                self.actionButton.setTitle("SIGN", for: .normal)
                break
            case .vote:
                self.actionImageView.image = UIImage(named: "Poll")
                self.actionTitle.text = "Take The Poll"
                self.actionDescriptionLabel.text = "What do you think about  this?"
                self.actionButton.setTitle("VOTE", for: .normal)
                break
            }
        }
        get {
            return self.action
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

