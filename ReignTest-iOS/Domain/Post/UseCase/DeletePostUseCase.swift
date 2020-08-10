//
//  DeletePostUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

class DeletePostUseCase: UseCase {
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func execute(params: Post) {
        return repository.deletePost(post: params)
    }
}
