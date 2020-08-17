//
//  PostLocalDataSourceFake.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift
@testable import ReignTest_iOS

class PostLocalDataSourceFake: PostLocalDataSourceProtocol {
    
    var isInsertPostsCalled = false
    var isDeletePostCalled = false
    
    func insertPosts(posts: [Post]) {
        isInsertPostsCalled = true
    }
    
    func getPosts() -> Observable<[Post]> {
        return Observable.just([PostFactory.newPost()])
    }
    
    func deletePost(post: Post) {
        isDeletePostCalled = true
    }
}
