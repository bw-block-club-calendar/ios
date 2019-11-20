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
    var memberController = MemberController()
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        nameLabel.isHidden = true
        emailLabel.isHidden = true
        titleLabel.isHidden = true
        emailLabel1.isHidden = true
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            guard let LoginVC = segue.destination as? LoginViewController else { return }
            LoginVC.memberController = memberController
        }
    }
}
