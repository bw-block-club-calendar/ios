//
//  NDL.swift
//  BlockClubCalenderUITests
//
//  Created by Jerry haaser on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    
    func loadData(from request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    
    func loadData(from url: URL, completion: @escaping( Data?, Error?) -> Void)
}
