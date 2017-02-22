//
//  SPTakeActionViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPTakeActionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var campaign = SPCampaign()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.tableView.register(UINib(nibName: "SPTakeActionTableViewCell", bundle: nil), forCellReuseIdentifier: "SPTakeActionTableViewCell")
        self.tableView.estimatedRowHeight = 150
        
        self.campaign.listOfActions.append(.donate)
        self.campaign.listOfActions.append(.sign)
        self.campaign.listOfActions.append(.vote)
        
        switch self.campaign.listOfActions.count {
        case 1:
            self.tableViewHeightConstraint.constant = 288
        case 2:
            self.tableViewHeightConstraint.constant = 438
        case 3:
            self.tableViewHeightConstraint.constant = 588
        default:
            self.tableViewHeightConstraint.constant = 100
        }
        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.campaign.listOfActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SPTakeActionTableViewCell", for: indexPath) as! SPTakeActionTableViewCell
        cell.action = self.campaign.listOfActions[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let campaignDetailViewController = SPCampaignDetailViewController(nibName: "SPCampaignDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(campaignDetailViewController, animated: true)
    }
    

    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
