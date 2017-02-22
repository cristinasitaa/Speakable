//
//  SPSignupViewController.swift
//  Speakable
//
//  Created by Admin on 2/20/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SPSignupViewController: UIViewController {
    
    
    @IBOutlet weak var signupWithFacebookButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var inputFieldsView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupWithFacebookButton.layer.cornerRadius = 8
        self.createAccountButton.layer.cornerRadius = 8
        self.inputFieldsView.layer.cornerRadius = 8
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func signupWithFacebookWasPressed(_ sender: UIButton) {
        let categorySelectionViewController = SPCategorySelectionViewController(nibName: "SPCategorySelectionViewController", bundle: nil)
        self.navigationController?.pushViewController(categorySelectionViewController, animated: true)
    }
    
    @IBAction func createAccountButtonWasPressed(_ sender: Any) {
        let categorySelectionViewController = SPCategorySelectionViewController(nibName: "SPCategorySelectionViewController", bundle: nil)
        self.navigationController?.pushViewController(categorySelectionViewController, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
