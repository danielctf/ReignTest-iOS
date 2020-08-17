//
//  RefreshPostsUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

class RefreshPostsUseCase: RefreshPostsUseCaseProtocol {
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func execute(onCompletion: @escaping () -> Void) {
        repository.refreshPosts { [weak self] in
            guard self != nil else { return }
            onCompletion()
        }
    }
}
