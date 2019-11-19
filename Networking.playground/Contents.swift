import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct User: Codable {
    let username: String
    let password: String
    let email: String
}

var str = "Hello, playground"
let baseURL = URL(string:"https://blockclubcal.herokuapp.com/api/auth/register")!

func registerUser( _ user: User) {
    var request = URLRequest(url: baseURL)
    request.httpMethod = "POST"
    
    do {
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(user)
    } catch {
        print("failed to encode data")
    }
    URLSession.shared.dataTask(with: request) { (_, response, error) in
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { return }
        print(response.statusCode)
        if let error = error {
            print("\(error)")
        }
    }.resume()
}

let tester = User(username: "tester15", password: "123456", email: "brian@gmail.com")
registerUser(tester)
