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
   // let location: Location
    
}

struct BearerToken: Codable {
    let token: String
}

struct UserID: Codable {
    let id: Int
    
}
struct Location: Codable {
   let name: String
   let streetAddress: String
   let city: String
   let zipcode: String
    let state: String
    
    enum codingKeys: String, CodingKey {
        case name
        case streetAddress = "street_address"
        case city
        case zipcode
        case state
    }
}

struct Profile: Codable {
    let userID: Int
    let firstName: String
    let lastName: String
    
}


class API {
    static var id: UserID?
    static var bearer: BearerToken?

    let baseURL = URL(string: "https://blockclubcal.herokuapp.com/api/")!
    
    func register(_ user: User, completion: @escaping(Error?) -> Void = {_ in }) {
    
      let registerURL = baseURL.appendingPathComponent("auth").appendingPathComponent("register")
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let json = """
        {
            "username" : "\(user.username)",
            "password" : "\(user.password)",
            "email" : "\(user.email)"
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
                
                API.id = try decoder.decode(UserID.self, from: data)
                
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
               
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
    
    func createProfile(forUser user: User) {
        
            guard let userID = API.id else { return }
            let profileURL = baseURL.appendingPathComponent("profile")
                
                var request = URLRequest(url: profileURL)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
                let json = """
                   {
                        "user_id" : "\(userID.id)",
                       "first_name" : "\(user.firstName)",
                        "last_name": "\(user.lastName)"
                   }
                   """
                   let jsonData = json.data(using: .utf8)
                   request.httpBody = jsonData
                   
                URLSession.shared.dataTask(with: request) { (_ , response, error) in
                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                    }
                    if let error = error {
                        print("error: \(error)")
                    }
                    
                }.resume()
    }
    
    func createEvent(){}
    
    
}

let api = API()

let location = Location(name: "home", streetAddress: "5 rio grande street", city: "west jordan", zipcode: "84088", state: "utah")

let user = User(firstName: "chris", lastName: "hemsworth", username: "thor", password: "123456", email: "realThor@gmail.com")

// api.register(user)
api.createProfile(forUser: user)
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
