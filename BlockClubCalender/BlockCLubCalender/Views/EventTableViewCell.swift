//
//  EventTableViewCell.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var event: Event? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let event = event else { return }
        titleLabel.text = event.title
    }
}
