//
//  SignupViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UITextFieldDelegate {

    //MARK: - Properties
    var memberController: MemberController?
   
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
    
    private var firstNameTextfield: UITextField = {
            let textfield = UITextField()
         textfield.translatesAutoresizingMaskIntoConstraints = false
         textfield.placeholder = "firstname"
            return textfield
        }()
    
    private var lastNameTextfield: UITextField = {
            let textfield = UITextField()
         textfield.translatesAutoresizingMaskIntoConstraints = false
         textfield.placeholder = "lastname"
            return textfield
        }()
    
    private var emailTextfield: UITextField = {
            let textfield = UITextField()
         textfield.translatesAutoresizingMaskIntoConstraints = false
         textfield.placeholder = "email"
            return textfield
        }()
       
       private var CreateAccountLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "Create Account"
           label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .left
           return label
       }()
    
      private var subtitleLabel: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = "lets get the basics for your account!"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
                label.numberOfLines = 2
             label.textAlignment = .left
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
    
    private var emailView: UIView = {
              let view = UIView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
              return view
          }()
    
    private var firstnameView: UIView = {
              let view = UIView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
              return view
          }()
    
    private var lastnameView: UIView = {
              let view = UIView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
              return view
          }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        navigationController?.isNavigationBarHidden = true
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        emailTextfield.delegate = self
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
        
        view.addSubview(CreateAccountLabel)
        CreateAccountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        CreateAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        CreateAccountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: CreateAccountLabel.bottomAnchor, multiplier: 3).isActive = true
        
        view.addSubview(firstnameView)
        firstnameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        firstnameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        firstnameView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 10).isActive = true
        firstnameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        firstnameView.addSubview(firstNameTextfield)
        firstNameTextfield.leadingAnchor.constraint(equalTo: firstnameView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        firstNameTextfield.trailingAnchor.constraint(equalTo: firstnameView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        firstNameTextfield.topAnchor.constraint(equalTo: firstnameView.safeAreaLayoutGuide.topAnchor).isActive = true
        firstNameTextfield.bottomAnchor.constraint(equalTo: firstnameView.safeAreaLayoutGuide.bottomAnchor).isActive = true
       
        view.addSubview(lastnameView)
        lastnameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        lastnameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        lastnameView.topAnchor.constraint(equalToSystemSpacingBelow: firstnameView.bottomAnchor, multiplier: 4).isActive = true
        lastnameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        lastnameView.addSubview(lastNameTextfield)
        lastNameTextfield.leadingAnchor.constraint(equalTo: lastnameView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        lastNameTextfield.trailingAnchor.constraint(equalTo: lastnameView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        lastNameTextfield.topAnchor.constraint(equalTo: lastnameView.safeAreaLayoutGuide.topAnchor).isActive = true
        lastNameTextfield.bottomAnchor.constraint(equalTo: lastnameView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        view.addSubview(emailView)
        emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        emailView.topAnchor.constraint(equalToSystemSpacingBelow: lastnameView.bottomAnchor, multiplier: 4).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emailView.addSubview(emailTextfield)
        emailTextfield.leadingAnchor.constraint(equalTo: emailView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        emailTextfield.trailingAnchor.constraint(equalTo: emailView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: emailView.safeAreaLayoutGuide.topAnchor).isActive = true
        emailTextfield.bottomAnchor.constraint(equalTo: emailView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        view.addSubview(usernameView)
        usernameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        usernameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        usernameView.topAnchor.constraint(equalToSystemSpacingBelow: emailView.bottomAnchor, multiplier: 4).isActive = true
        usernameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        usernameView.addSubview(usernameTextfield)
        usernameTextfield.leadingAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        usernameTextfield.trailingAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        usernameTextfield.topAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.topAnchor).isActive = true
        usernameTextfield.bottomAnchor.constraint(equalTo: usernameView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
        view.addSubview(passwordView)
        passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        passwordView.topAnchor.constraint(equalToSystemSpacingBelow: usernameView.bottomAnchor, multiplier: 4).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passwordView.addSubview(passwordTextfield)
        passwordTextfield.leadingAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        passwordTextfield.trailingAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.topAnchor).isActive = true
        passwordTextfield.bottomAnchor.constraint(equalTo: passwordView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
    //MARK: - Actions
    @IBAction func doneButton(_ sender: UIButton) {
        guard let firstname = firstNameTextfield.text, !firstname.isEmpty,
            let lastname = lastNameTextfield.text, !lastname.isEmpty,
            let email = emailTextfield.text, !email.isEmpty,
            let username = usernameTextfield.text, !username.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else { return }
        
        memberController?.register(firstName: firstname.lowercased(), lastName: lastname.lowercased(), username: username.lowercased(), password: password.lowercased(), email: email.lowercased(), completion: { (error) in
            if let error = error {
                    NSLog("error logging in: \(error)")
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "error", message: "we cant create your account at this time", preferredStyle: .alert)
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
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as! ProfileViewController
        profileVC.user = MemberController.user
    }
}

extension SignupViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextfield {
            textField.resignFirstResponder()
            lastNameTextfield.becomeFirstResponder()
            return true
        } else if textField == lastNameTextfield {
            textField.resignFirstResponder()
            emailTextfield.becomeFirstResponder()
            return true
        } else if textField == emailTextfield {
            textField.resignFirstResponder()
            usernameTextfield.becomeFirstResponder()
            return true
        } else if textField == usernameTextfield {
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
