//
//  LoginModel.swift
//  Cinema
//
//  Created by stefano vecchiati on 23/10/2018.
//Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class LoginModel: Object {
    
    dynamic var access_token: String!
    dynamic var created_at: Int!
    dynamic var expires_in: Int!
    dynamic var scope: String!
    dynamic var token_type: String!
    dynamic var id : String = "access_token"
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(access_token: String, created_at: Int, expires_in: Int, scope: String, token_type: String) {
        self.init()
        
        self.access_token = access_token
        self.created_at = created_at
        self.expires_in = expires_in
        self.scope = scope
        self.token_type = token_type
        
    }
    
    func save(in realm: Realm = try! Realm(configuration: RealmUtils.config)) {
        do {
            try realm.write {
                realm.add(self, update: true)
            }
        } catch {}
    }
    
    static func getObject(in realm: Realm = try! Realm(configuration: RealmUtils.config), withId id : String) -> LoginModel? {
        return realm.object(ofType: LoginModel.self, forPrimaryKey: id)
    }
}
