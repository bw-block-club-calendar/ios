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
    static var bearer: BearerToken?
    static var user: User?
    let baseURL = URL(string: "https://blockclubcal.herokuapp.com/api/")!
    
    
    //MARK: - C.R.U.D METHODS

      ///create
      func createEvent(_ title: String, address: String, description: String, eventDate: Date) {
        _ = Event(address: address, eventDate: eventDate, eventDescription: description, title: title, context: CoreDataStack.shared.mainContext)
        CoreDataStack.shared.mainContext.saveChanges()
      }
    
    func register(firstName: String, lastName: String, username: String, password: String, email:String, completion: @escaping(Error?) -> Void) {

         let registerURL = baseURL.appendingPathComponent("auth").appendingPathComponent("register")
           var request = URLRequest(url: registerURL)
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
           let json = """
           {
               "username" : "\(username)",
               "password" : "\(password)",
                   "email" : "\(email)"
           }
           """
           let jsonData = json.data(using: .utf8)
           request.httpBody = jsonData
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode != 201 {
                   completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return 
               }
               if let error = error {
                   print("error decoding token: \(error.localizedDescription)")
                   completion(error)
               }
               
               guard let data = data else { return completion(NSError())}
               
               do {
                   let decoder = JSONDecoder()
                   MemberController.bearer = try decoder.decode(BearerToken.self, from: data)
               } catch {
                   print("error decoding token and userid: \(error.localizedDescription)")
               }
            
            completion(nil)
           }.resume()
       }
      ///delete
      func deleteEvent(_ event: Event) {
          CoreDataStack.shared.mainContext.delete(event)
          CoreDataStack.shared.mainContext.saveChanges()
      }
}

extension MemberController {
    
    func signOut() {
        MemberController.bearer = nil
    }
    
    func loginUser(username: String, password: String, completion: @escaping(Error?) -> Void){
        let registerURL = baseURL.appendingPathComponent("auth")
                 .appendingPathComponent("login")
          
          var request = URLRequest(url: registerURL)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          let json = """
                    {
                        "username" : "\(username)",
                        "password": "\(password)"
                    }
                    """
                    let jsonData = json.data(using: .utf8)
                    request.httpBody = jsonData
          
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
                MemberController.self.bearer = try decoder.decode(BearerToken.self, from: data)
              } catch {
                  print("error decoding data: \(error.localizedDescription)")
              }
            completion(nil)
          }.resume()
    
      }

}
