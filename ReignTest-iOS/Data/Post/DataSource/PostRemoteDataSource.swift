//
//  PostRemoteDataSource.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/1/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

class PostRemoteDataSource: PostRemoteDataSourceProtocol {
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func getPosts(onCompletion: @escaping (Result<PostResponse>) -> Void) {
        manager.request(
            endpoint: ServerConstants.POST_ENDPOINT,
            onCompletion: onCompletion
        )
    }
}
