//
//  GetPostsUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/3/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class GetPostsUseCase: GetPostsUseCaseProtocol {
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func execute() -> Observable<[Post]> {
        return repository.getPosts()
    }
}
