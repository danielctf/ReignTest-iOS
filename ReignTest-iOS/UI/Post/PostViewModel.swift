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
        refreshPostsUseCase.execute()
    }

    func getPosts() -> Observable<[Post]> {
        return getPostsUseCase.execute()
    }
}
