//
//  PostViewModel.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/3/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class PostViewModel {
    
    let loading = PublishSubject<Bool>()
    
    private let getPostsUseCase: GetPostsUseCase
    private let refreshPostsUseCase: RefreshPostsUseCase
    private let deletePostUseCase: DeletePostUseCase
    
    init(
        getPostsUseCase: GetPostsUseCase = GetPostsUseCase(),
        refreshPostsUseCase: RefreshPostsUseCase = RefreshPostsUseCase(),
        deletePostUseCase: DeletePostUseCase = DeletePostUseCase()
    ) {
        self.getPostsUseCase = getPostsUseCase
        self.refreshPostsUseCase = refreshPostsUseCase
        self.deletePostUseCase = deletePostUseCase
        
        refreshPosts()
    }
    
    func refreshPosts() {
        loading.onNext(true)
        refreshPostsUseCase.execute() { [weak self] in
            self?.loading.onNext(false)
        }
    }

    func getPosts() -> Observable<[Post]> {
        return getPostsUseCase.execute()
    }
    
    func deletePost(post: Post) {
        deletePostUseCase.execute(params: post)
    }
}
