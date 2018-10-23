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
    
    // MARK: Request Header
    
    private func authorizationHeader() -> HTTPHeaders {
        
        guard let token = <#String#> else {
            return ["Authorization": "bearer "]
        }
        
        return ["Authorization": "bearer "]
        
    }
    
    static func access(email: String, password: String, completion: @escaping (Bool) -> ()) {
        
        let param : Parameters? = nil
        let header : HTTPHeaders? = nil
        
        guard let url = URL(string: <#String#>) else {
            completion(false)
        }
        
        Alamofire.request(url,
                          method: .post,
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

}
