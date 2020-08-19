//
//  PostResponseFactory.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
@testable import ReignTest_iOS

class PostResponseFactory {
    
    static func newResponse() -> PostResponse {
        return PostResponse(hits: [PostFactory.newPost()])
    }
}
