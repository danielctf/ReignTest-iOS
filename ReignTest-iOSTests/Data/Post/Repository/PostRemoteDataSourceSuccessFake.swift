//
//  PostRemoteDataSourceSuccessFake.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
@testable import ReignTest_iOS

class PostRemoteDataSourceSuccessFake: PostRemoteDataSourceProtocol {
    
    var isCalled = false
    
    func getPosts(onCompletion: @escaping (Result<PostResponse>) -> Void) {
        isCalled = true
        onCompletion(Result.success(data: PostResponseFactory.newResponse()))
    }
}
