//
//  CommunityMemberController.swift
//  BlockClubCalender
//
//  Created by brian vilchez on 11/19/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData
class MemberController {
    
    //MARK: - Properties
    var bearer: BearerToken?
    
    let baseURL = URL(string: "https://blockclubcal.herokuapp.com/api/")!
    //MARK: - C.R.U.D METHODS
      
      ///create
      func createEvent(_ title: String, address: String, description: String, eventDate: Date) {
        let event = Event(address: address, eventDate: eventDate, eventDescription: description, title: title, context: CoreDataStack.shared.mainContext)
        
        CoreDataStack.shared.mainContext.saveChanges()
      }
    
    func Register(_ name: String ,username: String, password: String, email: String) {
            let user = User(username: password, password: password, email: email)
            registerUser(user)
            CoreDataStack.shared.mainContext.saveChanges()
    }
      ///delete
      func deleteEvent(_ event: Event) {
          CoreDataStack.shared.mainContext.delete(event)
          CoreDataStack.shared.mainContext.saveChanges()
      }
}

extension MemberController {
    
    private func registerUser(_ user: User, completion: @escaping(Error) -> Void = {_ in}) {
        let registerURL = baseURL.appendingPathComponent("auth")
                                 .appendingPathComponent("register")
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(user.userRepresentation)
        } catch {
            completion(error)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let error = error {
                completion(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.bearer = try decoder.decode(BearerToken.self, from: data)
            } catch {
                print("error getting token")
                completion(error)
            }
        }.resume()
    }
    
   func loginUser(withUser user: User, completion: @escaping(Error?) -> Void){
        let registerURL = baseURL.appendingPathComponent("auth")
                 .appendingPathComponent("login")
          
          var request = URLRequest(url: registerURL)
          request.httpMethod = "POST"
         // request.setValue("accessToken", forHTTPHeaderField: "Authorization")
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          do {
              let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(user.userRepresentation)
              request.httpBody = data
          } catch {
              print("failed to encode User: \(error)")
              completion(error)
          }
          
          URLSession.shared.dataTask(with: request) { ( data , response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                  print(response.statusCode)
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
              }
              
              if let error = error {
                  completion(error)
              }
              guard let data = data else { return completion(NSError())}
              
              do {
                  let decoder = JSONDecoder()
                  self.bearer = try decoder.decode(BearerToken.self, from: data)
              } catch {
                  print("error decoding data: \(error.localizedDescription)")
              }
            completion(nil)
          }.resume()
    
      }

}
