//
//  LoginViewViewModel.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//
/*
 URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 email - info@rapptrlabs.com
 password - Test123
 */

import Foundation

class LoginViewViewModel  {
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        let parameters = [
            "email": email,
            "password": password
        ]
        var endPointURLComponents = URLComponents(string: "https://dev.rapptrlabs.com/Tests/scripts/login.php")!
        endPointURLComponents.queryItems = parameters.map({ (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: String(value))
        })
        guard let url = endPointURLComponents.url else {
            return
        }
        let startDate = Date()
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            let timeItTook = abs(Date().distance(to: startDate) * 1000)

            if let error = error {
                DispatchQueue.main.async {
                    errorHandler("\(error.localizedDescription) The API call took \(round(timeItTook)) milliseconds")
                }
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        if response.code == "Error" {
                            errorHandler("\(response.message) The API call took \(round(timeItTook)) milliseconds")
                        } else {
                            completion("\(response.message) The API call took \(round(timeItTook)) milliseconds")
                        }
                    }
                } catch {
                    
                    DispatchQueue.main.async {
                        errorHandler(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
}

struct Response: Codable {
    let code: String
    let message: String
}

