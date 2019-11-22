//
//  EventDetailViewController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    
    //MARK: - properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    var event: Event? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateViews()
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        guard let event = event else { return configureViews()}
        titleLabel.text = event.title
        descriptionTextView.text = event.eventDescription
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm-dd-yyyy HH:mm"
        
        guard let date = event.eventDate else  { return }
        let formatedDate = dateFormatter.string(from: date)
        dateLabel.text = "\(formatedDate)"
    }

    private func configureViews() {
        dateLabel.text = ""
        titleLabel.text = ""
        descriptionTextView.text = ""
    }
}
