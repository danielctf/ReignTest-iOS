//
//  PostRepository.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/3/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class PostRepository: PostRepositoryProtocol {
    
    private let remote: PostRemoteDataSourceProtocol
    private let local: PostLocalDataSourceProtocol
    
    init(
        remote: PostRemoteDataSourceProtocol = PostRemoteDataSource(),
        local: PostLocalDataSourceProtocol = PostLocalDataSource()
    ) {
        self.remote = remote
        self.local = local
    }
    
    func refreshPosts(onCompletion: @escaping () -> Void) {
        remote.getPosts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.local.insertPosts(posts: data.hits)
            case .error(_):
                break
            }
            onCompletion()
        }
    }
    
    func getPosts() -> Observable<[Post]> {
        return local.getPosts()
    }
    
    func deletePost(post: Post) {
        local.deletePost(post: post)
    }
}
