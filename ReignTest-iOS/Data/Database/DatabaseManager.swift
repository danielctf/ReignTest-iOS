//
//  DatabaseManager.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/4/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class DatabaseManager {
    
    private let realm: Realm
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
    
    func writeObjects<T: Object>(items: [T]) {
        try! realm.write {
            realm.add(items, update: .modified)
        }
    }
    
    func writeObject<T: Object>(item: T) {
        writeObjects(items: [item])
    }
    
    func getObservableObjects<T: Object>() -> Observable<[T]> {
        return Observable.array(from: realm.objects(T.self))
    }
}
