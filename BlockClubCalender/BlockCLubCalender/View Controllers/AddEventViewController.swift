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
    
    @IBOutlet weak var titleTextfield: UIStackView!
    @IBOutlet weak var addressTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextView!
    
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions 
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
}
