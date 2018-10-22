//
//  User.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import RealmSwift

@objcMembers class User: Object {
    dynamic var id : String!
    dynamic var email : String!
    dynamic var password : String!
    
    convenience init(email : String, password : String) {
        self.init()
        
        self.id = email
        self.email = email
        self.password = password
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func save(in realm: Realm = try! Realm(configuration: RealmUtils.config)) {
        do {
            try realm.write {
                realm.add(self, update: true)
            }
        } catch {}
    }
    
    static func getObject(in realm: Realm = try! Realm(configuration: RealmUtils.config), withId id : String) -> User? {
        return realm.object(ofType: User.self, forPrimaryKey: id)
    }
}
