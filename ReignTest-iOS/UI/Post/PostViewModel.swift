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
    let navigateToDetails = PublishSubject<String>()
    let error = PublishSubject<Void>()
    
    private let getPostsUseCase: GetPostsUseCaseProtocol
    private let refreshPostsUseCase: RefreshPostsUseCaseProtocol
    private let deletePostUseCase: DeletePostUseCaseProtocol
    
    init(
        getPostsUseCase: GetPostsUseCaseProtocol = GetPostsUseCase(),
        refreshPostsUseCase: RefreshPostsUseCaseProtocol = RefreshPostsUseCase(),
        deletePostUseCase: DeletePostUseCaseProtocol = DeletePostUseCase()
    ) {
        self.getPostsUseCase = getPostsUseCase
        self.refreshPostsUseCase = refreshPostsUseCase
        self.deletePostUseCase = deletePostUseCase
        
        refreshPosts()
    }
    
    func refreshPosts() {
        loading.onNext(true)
        refreshPostsUseCase.execute() { [weak self] in
            guard let self = self else { return }
            self.loading.onNext(false)
        }
    }

    func getPosts() -> Observable<[Post]> {
        return getPostsUseCase.execute()
    }
    
    func deletePost(post: Post) {
        deletePostUseCase.execute(post: post)
    }
    
    func postClicked(post: Post) {
        if let url = post.getUrl() {
            navigateToDetails.onNext(url)
        } else {
            error.onNext(())
        }
    }
}
