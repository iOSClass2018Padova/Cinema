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
        
        guard let headerInformation = LoginModel.getObject(withId: "access_token") else {
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
                
                guard let values = response.result.value as? [String : Any] else {
                    completion(false)
                    return
                }
                
                LoginModel(access_token: values["access_token"] as! String, created_at: values["created_at"] as! Int, expires_in: values["expires_in"] as! Int, scope: values["scope"] as! String, token_type: values["token_type"] as! String).save()
                
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
