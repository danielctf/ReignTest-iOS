//
//  PostRepositoryProtocol.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/3/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

protocol PostRepositoryProtocol {
    
    func getPosts() -> Observable<[Post]>
    func refreshPosts(onCompletion: @escaping () -> Void)
    func deletePost(post: Post)
}
