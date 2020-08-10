//
//  PostLocalDataSourceProtocol.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/7/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

protocol PostLocalDataSourceProtocol {
    
    func insertPosts(posts: [Post])
    func getPosts() -> Observable<[Post]>
    func deletePost(post: Post)
}
