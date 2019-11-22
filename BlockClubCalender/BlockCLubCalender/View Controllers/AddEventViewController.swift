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
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextView!
    var memberController: MemberController?
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
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
    
    func configureViews() {
        titleTextfield.text = ""
        addressTextfield.text = ""
        dateTextfield.text = ""
        descriptionTextfield.text = ""
    }
}
