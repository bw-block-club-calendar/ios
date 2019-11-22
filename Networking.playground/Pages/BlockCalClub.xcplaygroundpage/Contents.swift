import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true 

struct User: Codable {
    
    let firstName: String
    let lastName: String
    let username: String
    let password: String
    let email: String
    var userID: Int = 0
    
}

struct BearerToken: Codable {
    let token: String
}

struct UserID: Codable {
    let id: Int
    
}


class API {
    static var id: UserID?
    static var bearer: BearerToken?
    let baseURL = URL(string: "https://blockclubcal.herokuapp.com/api/")!
    
    func register(firstName: String, lastName: String, username: String, password: String, email:String, completion: @escaping(Error?) -> Void = {_ in }) {
        let user = User(firstName: firstName, lastName: lastName, username: username, password: password, email: email)
        
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
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            if let error = error {
                print("error decoding token: \(error.localizedDescription)")
                completion(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                API.bearer = try decoder.decode(BearerToken.self, from: data)
                print(API.bearer)
                API.id = try decoder.decode(UserID.self, from: data)
                print(API.id)
            } catch {
                print("error decoding token and userid: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func login(_ username: String, password: String, completion: @escaping(Error) -> Void = {_ in}){
        let loginURL = baseURL.appendingPathComponent("auth").appendingPathComponent("login")
        
        var request = URLRequest(url: loginURL)
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
           
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            if let error = error {
                print("error: \(error)")
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                API.bearer = try decoder.decode(BearerToken.self, from: data)
                print(API.bearer)
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
    
    func createProfile(forUser user: User) {
        let profileURL = baseURL.appendingPathComponent("profile")
            
            var request = URLRequest(url: profileURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let json = """
               {
                   "username" : "",
                   "password": ""
               }
               """
               let jsonData = json.data(using: .utf8)
               request.httpBody = jsonData
               
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                }
                if let error = error {
                    print("error: \(error)")
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    API.bearer = try decoder.decode(BearerToken.self, from: data)
                    print(API.bearer)
                } catch {
                    print("error: \(error)")
                }
            }.resume()
        
    }
    
    func createEvent(){}
    
    
}

let api = API()
api.register(firstName: "brian", lastName: "vilchez", username: "brybry1992", password: "123456", email: "1992@gmail.com")
//api.login("brybry1995", password: "123456")


/*
 "user_id": 2,
 "first_name": "Test",
 "last_name": "User",
   "location": {
   "name": "testUser's House",
   "coordinates": null,
   "street_address": "7432 Brush St",
   "street_address_2": null,
   "city": "Detroit",
   "zipcode": "48202",
   "state": "MI"
   }
 */
struct Location: Codable {
   let name: String
   let streetAddress: String
   let city: String
   let zipcode: String
    let state: String 
    
}

struct Profile: Codable {
    let userID: Int
    let firstName: String
    let lastName: String
    let location: Location
}
