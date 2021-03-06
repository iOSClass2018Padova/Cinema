//
//  NetworkManager.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
    private static let basicAdress = "http://api-staging.emotifood.it/v1/"
    
    // MARK: Request Header
    
    private static func authorizationHeader() -> HTTPHeaders {
        
        guard let headerInformation = LoginModel.all().first else {
            return ["Authorization": ""]
        }

        return ["Authorization": headerInformation.token_type + " " + headerInformation.access_token]

    }
    
    static func login(email: String, password: String, completion: @escaping (Bool) -> ()) {
        
        let param : Parameters? = ["grant_type": "password",
                                   "email": email,
                                   "password": password]
        let header : HTTPHeaders? = nil
        
        guard let url = URL(string: basicAdress + "oauth/token") else {
            completion(false)
            return
        }
        
        Alamofire.request(url,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: header)
            .validate()
            .responseJSON { response in
                
            debugPrint(response.result)
            switch(response.result) {
            case .success(_):
                
                guard let jsonData = response.data else {
                    completion(false)
                    return
                }
                
                
                do {
                    
                    let decoder = JSONDecoder()
                    
                    try decoder.decode(LoginModel.self, from: jsonData).save()
                    
                } catch let err {
                    print(err)
                    completion(false)
                }
                
                completion(true)


            case .failure(_):
                completion(false)

            }
        }
        
    }
    
    static func getUser(completion: @escaping (Bool) -> ()) {
        let param : Parameters? = nil
        let header : HTTPHeaders? = authorizationHeader()
        
        guard let url = URL(string: basicAdress + "user") else {
            completion(false)
            return
        }
        
        Alamofire.request(url,
                          method: .get,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: header)
            .validate()
            .responseJSON { response in
                
                debugPrint(response)
                switch(response.result) {
                case .success(_):
                    completion(true)
                    
                    
                case .failure(_):
                    completion(false)
                    
                }
        }
    }
    
    static func checkToken(completion: @escaping (Bool) -> ()) {
        
        let param : Parameters? = nil
        let header : HTTPHeaders? = authorizationHeader()
        
        guard let url = URL(string: basicAdress + "oauth/token/info") else {
            completion(false)
            return
        }
        
        Alamofire.request(url,
                          method: .get,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: header)
            .validate()
            .responseJSON { response in
                
                debugPrint(response.result)
                switch(response.result) {
                case .success(_):
                    completion(true)
                    
                    
                case .failure(_):
                    completion(false)
                    
                }
        }
        
    }

}

