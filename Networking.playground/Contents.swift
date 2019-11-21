import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct BearerToken: Codable {
    let token: String
}

struct UserID: Codable {
    let id: Int
}


struct User: Codable {
    let username: String
    let password: String
    let email: String = ""
    

    enum UserCodingKey: String, CodingKey {
        case username
        case password
        case email
    }
}

class APIController {
    
    let baseURL = URL(string:"https://blockclubcal.herokuapp.com/api/")!
    var bearerToken: BearerToken?
    var user: User?
    var userID: Int = 0
    
    func loginUser(_ user: User, completion: @escaping(Error?) -> Void){
      let registerURL = baseURL.appendingPathComponent("auth")
               .appendingPathComponent("login")
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
       // request.setValue("accessToken", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(user)
            request.httpBody = data
        } catch {
            print("failed to encode User: \(error)")
            completion(error)
        }
        
        URLSession.shared.dataTask(with: request) { ( data , response, error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let error = error {
                completion(error)
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.bearerToken = try decoder.decode(BearerToken.self, from: data)
                print(self.bearerToken)
            } catch {
                print("error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }

    func register(_ user: User, completion: @escaping(Error) -> Void = {_ in}){
        let registerURL = baseURL.appendingPathComponent("auth")
                                 .appendingPathComponent("register")
        
        print(registerURL)
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            request.httpBody = data
        } catch {
            completion(error)
        }
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let error = error {
                print("\(error.localizedDescription)")
                completion(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.bearerToken = try decoder.decode(BearerToken.self, from: data)
                print(self.bearerToken)
            } catch {
                completion(error)
            }
            
        }.resume()
    }
}
let api = APIController()
let user = User(username: "brybry0011", password: "123456")

//api.register(user)
api.loginUser(user) { (_) in

}
