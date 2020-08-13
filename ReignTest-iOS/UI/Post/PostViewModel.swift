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
    
    init(
        getPostsUseCase: GetPostsUseCase = GetPostsUseCase(),
        refreshPostsUseCase: RefreshPostsUseCase = RefreshPostsUseCase()
    ) {
        self.getPostsUseCase = getPostsUseCase
        self.refreshPostsUseCase = refreshPostsUseCase
        
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
}
