//
//  DeletePostUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

class DeletePostUseCase: DeletePostUseCaseProtocol {
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func execute(post: Post) {
        return repository.deletePost(post: post)
    }
}
