//
//  AddEventViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    
    //MARK: - properties
    
    @IBOutlet weak var descriptionTextfield: UITextView!
    var memberController: MemberController?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private var addressLabel: UILabel = {
          let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address"
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
          return label
      }()
      
    private var dateLabel: UILabel = {
          let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
          return label
      }()
      
    
    private var titleTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "title"
        return textfield
    }()
    
    private var addressTextfield: UITextField = {
         let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "address"
         return textfield
     }()
    
    private var dateTextfield: UITextField = {
         let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "date"
         return textfield
     }()
     
    private var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
        return view
    }()
    
    private var addressView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor =  #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
          return view
      }()
    
    private var dateView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor =  #colorLiteral(red: 0.9019607843, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
          return view
      }()
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setupSubViews()
    }
    
    //MARK: - Actions 
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
      guard let title = titleTextfield.text,
            let address = addressTextfield.text,
            let dateString = dateTextfield.text,
            let description = descriptionTextfield.text else { return }

        let dateFormatter = DateFormatter()
       let formatedDate = dateFormatter.date(from: dateString)
        if let date = formatedDate {
         memberController?.createEvent(title, address: address, description: description, eventDate: date)
            dismiss(animated: true, completion: nil)
        } else {
          memberController?.createEvent(title, address: address, description: description, eventDate: Date())
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupSubViews() {
        view.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        view.addSubview(titleView)
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleView.addSubview(titleTextfield)
        titleTextfield.leadingAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleTextfield.trailingAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleTextfield.topAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.topAnchor).isActive = true
        titleTextfield.bottomAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.bottomAnchor).isActive = true 
        
        view.addSubview(addressLabel)
        addressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        addressLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 2).isActive = true
        
        view.addSubview(addressView)
        addressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        addressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        addressView.topAnchor.constraint(equalToSystemSpacingBelow: addressLabel.bottomAnchor, multiplier: 2).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addressView.addSubview(addressTextfield)
        addressTextfield.leadingAnchor.constraint(equalTo: addressView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        addressTextfield.trailingAnchor.constraint(equalTo: addressView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        addressTextfield.topAnchor.constraint(equalTo: addressView.safeAreaLayoutGuide.topAnchor).isActive = true
        addressTextfield.bottomAnchor.constraint(equalTo: addressView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: addressView.bottomAnchor, multiplier: 2).isActive = true
        
        view.addSubview(dateView)
        dateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        dateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dateView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 2).isActive = true
        dateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        dateView.addSubview(dateTextfield)
        dateTextfield.leadingAnchor.constraint(equalTo: dateView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        dateTextfield.trailingAnchor.constraint(equalTo: dateView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dateTextfield.topAnchor.constraint(equalTo: dateView.safeAreaLayoutGuide.topAnchor).isActive = true
        dateTextfield.bottomAnchor.constraint(equalTo: dateView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    func configureViews() {
        titleTextfield.text = ""
        addressTextfield.text = ""
        dateTextfield.text = ""
        descriptionTextfield.text = ""
    }
}
