//
//  SPCategorySelectionViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class SPCategorySelectionViewController: UIViewController {
    
    @IBOutlet weak var floatingView: SKView!
    private var floatingCollectionScene: BubblesScene!
    var categories = [SPCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        floatingCollectionScene = BubblesScene(size: self.floatingView.bounds.size)
        
        self.floatingView.allowsTransparency = true
        self.floatingView.backgroundColor = UIColor.clear
        
        self.floatingView.presentScene(floatingCollectionScene)
        
        SPWebServiceManager.sharedInstance.getCategories({(response) in
            if (response.result.isSuccess) {
                self.parseResponse(response: response.result.value as! NSArray)
                DispatchQueue.main.async {
                    for category in self.categories {
                        let node = BubbleNode.instantiateWithTitle(title: category.categoryName)
                        self.floatingCollectionScene.addChild(node!)
                    }
                }
                
            }
        })
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        floatingCollectionScene.performCommitSelectionAnimation()
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(red:0.93, green:0.10, blue:0.27, alpha:1.0)
        
        let feedViewController = SPFeedViewController(nibName: "SPFeedViewController", bundle: nil)
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
       
        let donationsViewController = SPDonationsViewController(nibName: "SPDonationsViewController", bundle: nil)
        let donationsNavigationController = UINavigationController(rootViewController: donationsViewController)
       
        let settingsViewController = SPSettingsViewController(nibName: "SPSettingsViewController", bundle: nil)
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
        
        
        tabBarController.viewControllers = [feedNavigationController, donationsNavigationController, settingsNavigationController]
        
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "Feed"), tag: 1)
        donationsViewController.tabBarItem = UITabBarItem(title: "My Donations", image: UIImage(named: "Donations"), tag: 2)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "Settings"), tag: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.navigationController?.pushViewController(tabBarController, animated: true)
        })

    }

    @IBAction func backButtonAction(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func parseResponse(response: NSArray) {
        for categoryDict in response {
            let category = SPCategory(dict: categoryDict as! [String : AnyObject])
            self.categories.append(category)
        }
    }

}
