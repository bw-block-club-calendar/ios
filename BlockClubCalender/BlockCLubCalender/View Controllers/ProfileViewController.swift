//
//  ProfileViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel1: UILabel!
    @IBOutlet weak var SigninButton: UIButton!
    var memberController = MemberController()
    
    
    var user: User? {
        didSet{
            updateViews()
        }
        
    }
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if MemberController.bearer != nil {
            SigninButton.setTitle("Sign out", for: .normal)
        } else if MemberController.bearer == nil {
            SigninButton.setTitle("Sign in", for: .normal)
        }
    }
    private func updateViews() {
        guard let user = MemberController.user else { return  configureViews()}
        nameLabel.isHidden = false
        emailLabel.isHidden = false
        nameLabel.text = user.username
        emailLabel.text = user.email
    }
    
    
    private func configureViews() {
        nameLabel.isHidden = true
        emailLabel.isHidden = true
        titleLabel.isHidden = true
        emailLabel1.isHidden = true
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7916208187)
        tabBarController?.tabBar.isTranslucent = true
    }
  
    @IBAction func signinButton(_ sender: UIButton) {
        if MemberController.bearer != nil {
            memberController.signOut()
        } 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            guard let LoginVC = segue.destination as? LoginViewController else { return }
            LoginVC.memberController = memberController
            LoginVC.user = user
        }
    }
    
    @IBAction func unwindToProfile(_ sender: UIStoryboardSegue) {
        
    }
}
