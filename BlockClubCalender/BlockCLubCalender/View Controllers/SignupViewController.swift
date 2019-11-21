//
//  SignupViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var isBusiness: UISegmentedControl!
    var memberController: MemberController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        navigationController?.isNavigationBarHidden = true 
    }
    //MARK: - Actions
    @IBAction func doneButton(_ sender: UIButton) {
        guard let name = nameTextfield.text,
            let email = emailTextfield.text,
            let username = usernameTextfield.text,
            let password = passwordTextField.text else { return }
        
        if isBusiness.selectedSegmentIndex == 0 {
            memberController?.Register(name, username: username, password: password, email: email )
        } else {
            memberController?.Register(name, username: username, password: password, email: email)
        }
        dismiss(animated: true, completion: nil)
    }
}
