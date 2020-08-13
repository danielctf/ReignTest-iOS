//
//  PostLocalDataSource.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/4/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import RxRealm

class PostLocalDataSource: PostLocalDataSourceProtocol {
    
    private let realm: Realm
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
    
    func insertPosts(posts: [Post]) {
        try! realm.write {
            posts.forEach { newPost in
                if (!existsPost(newPost.objectID)) {
                    realm.add(newPost)
                }
            }
        }
    }
    
    private func existsPost(_ primaryKey: String) -> Bool {
        return realm.object(ofType: Post.self, forPrimaryKey: primaryKey) != nil
    }
    
    func getPosts() -> Observable<[Post]> {
        return Observable.array(from: realm.objects(Post.self)
            .filter("privateActive = 1")
            .sorted(byKeyPath: "createdAt", ascending: false)
        )
    }
    
    func deletePost(post: Post) {
        try! realm.write {
            post.active = Active.NO
            realm.add(post, update: .modified)
        }
    }
}
