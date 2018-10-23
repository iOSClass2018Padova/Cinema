//
//  LoginModel.swift
//  Cinema
//
//  Created by stefano vecchiati on 23/10/2018.
//Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class LoginModel: Object, Codable {
    
    dynamic var access_token: String!
    dynamic var created_at: Int!
    dynamic var expires_in: Int!
    dynamic var scope: String!
    dynamic var token_type: String!
    
    func save(in realm: Realm = try! Realm(configuration: RealmUtils.config)) {
        do {
            try realm.write {
                realm.deleteAll()
                realm.add(self)
            }
        } catch {}
    }
    
    static func all(in realm: Realm = try! Realm(configuration: RealmUtils.config)) -> [LoginModel] {
        return Array(realm.objects(LoginModel.self))
    }
}
