//
//  LoginViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - properties
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    var memberController: MemberController?
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func loginButton(_ sender: UIButton) {
        guard let username = usernameTextfield.text,
            let password = passwordTextfield.text else { return }
        memberController?.loginUser(username, password: password)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "SignupSegue" {
                  guard let signUpVC = segue.destination as? SignupViewController else { return }
                  signUpVC.memberController = memberController
              }
    }
}
