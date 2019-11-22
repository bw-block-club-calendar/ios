//
//  LoginViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    //MARK: - properties
    private var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "username"
        textfield.font = UIFont.systemFont(ofSize: 20)
        return textfield
    }()
    
   private var passwordTextfield: UITextField = {
       let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.placeholder = "password"
    textfield.isSecureTextEntry = true
       return textfield
   }()
    
    private var LoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private var usernameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
        return view
    }()
    
    private var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false 
        view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
        return view
    }()
    
    var memberController: MemberController?
    var user: User?
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    //MARK: - Actions
    @IBAction func loginButton(_ sender: UIButton) {
        guard let username = usernameTextfield.text,!username.isEmpty,
        let password = passwordTextfield.text, !password.isEmpty else { return }
        
        
        memberController?.loginUser( username: username.lowercased(), password: password.lowercased(), completion: { (error) in
            if let error = error {
                NSLog("error logging in: \(error)")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Login unsuccessful", message: "please check your login credentials", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
                }
            }
        })
       
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "SignupSegue" {
                  guard let navC = segue.destination as? UINavigationController else { return }
            guard let signUpVC = navC.viewControllers[0] as? SignupViewController else { return }
                  signUpVC.memberController = memberController
                  signUpVC.delegate = self
              }
    }
    
    
   private func configureViews() {
    usernameTextfield.delegate = self
    passwordTextfield.delegate = self
    view.addSubview(passwordView)
    view.addSubview(usernameView)
    view.addSubview(LoginLabel)
    
    LoginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    LoginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    LoginLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    
    usernameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    usernameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    usernameView.topAnchor.constraint(equalToSystemSpacingBelow: LoginLabel.bottomAnchor, multiplier: 5).isActive = true
    usernameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    passwordView.topAnchor.constraint(equalToSystemSpacingBelow: usernameView.bottomAnchor, multiplier: 3).isActive = true
    passwordView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    usernameView.addSubview(usernameTextfield)
    usernameTextfield.leadingAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    usernameTextfield.trailingAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
    usernameTextfield.topAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.topAnchor).isActive = true
    usernameTextfield.bottomAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    passwordView.addSubview(passwordTextfield)
    passwordTextfield.leadingAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
    passwordTextfield.topAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.topAnchor).isActive = true
    passwordTextfield.trailingAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
    passwordTextfield.bottomAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension LoginViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextfield {
            textField.resignFirstResponder()
            passwordTextfield.becomeFirstResponder()
            return true
        } else if textField == passwordTextfield {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}

extension LoginViewController: createUserDelegate {
    func CreateUser(_ user: User) {
        MemberController.user = user
        usernameTextfield.text = user.username
        passwordTextfield.text = user.password
       // print(MemberController.user)
    }
    
    
    
}
