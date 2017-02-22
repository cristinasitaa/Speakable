
//
//  SPWelcomeViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPWelcomeViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createAccountButton.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func createAccountWasPressed(_ sender: Any) {
        let signupViewController = SPSignupViewController(nibName: "SPSignupViewController", bundle: nil)
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
