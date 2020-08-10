//
//  PostLocalDataSource.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/4/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class PostLocalDataSource: PostLocalDataSourceProtocol {
    
    private let manager: DatabaseManager
    
    init(manager: DatabaseManager = DatabaseManager()) {
        self.manager = manager
    }
    
    func insertPosts(posts: [Post]) {
        manager.writeObjects(items: posts)
    }
    
    func getPosts() -> Observable<[Post]> {
        return manager.getObservableObjects()
    }
    
    func deletePost(post: Post) {
        post.active = Active.NO
        manager.writeObject(item: post)
    }
}
