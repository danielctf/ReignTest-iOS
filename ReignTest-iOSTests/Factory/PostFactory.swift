//
//  PostFactory.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
@testable import ReignTest_iOS

class PostFactory {
    
    static func newPost() -> Post {
        let post = Post()
        post.objectID = "id"
        post.createdAt = Date(timeIntervalSince1970: 0)
        post.storyTitle = "storyTitle"
        post.title = "title"
        post.url = "url"
        post.storyUrl = "storyUrl"
        post.author = "author"
        post.active = Active.YES
        return post
    }
}
