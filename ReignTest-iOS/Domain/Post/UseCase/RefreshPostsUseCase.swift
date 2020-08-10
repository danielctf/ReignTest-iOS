//
//  RefreshPostsUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

class RefreshPostsUseCase: UseCase {
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func execute(params: Void? = nil) {
        return repository.refreshPosts()
    }
}
