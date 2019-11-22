//
//  MDL.swift
//  BlockClubCalenderUITests
//
//  Created by Jerry haaser on 11/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
@testable import BlockClubCalender

class MockDataLoader: NetworkDataLoader {
    var request: URLRequest?
    var data: Data?
    var error: Error?
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let request = URLRequest(url: url)
        self.request = request
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
}
