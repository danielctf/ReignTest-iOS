//
//  PostRepositoryTest.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import XCTest
@testable import ReignTest_iOS

class PostRepositoryTest: XCTestCase {
    
    private let local = PostLocalDataSourceFake()
    
    private func newRepository(withRemoteSuccess: Bool) -> PostRepository {
        var remote: PostRemoteDataSourceProtocol
        if (withRemoteSuccess) {
            remote = PostRemoteDataSourceSuccessFake()
        } else {
            remote = PostRemoteDataSourceErrorFake()
        }
        return PostRepository(remote: remote, local: local)
    }
    
    func test_refreshPostsSuccess_callInsertPosts() {
        // Given
        let repository = newRepository(withRemoteSuccess: true)
        
        // When
        repository.refreshPosts { }
        
        // Then
        XCTAssertEqual(local.isInsertPostsCalled, true)
    }
    
    func test_refreshPostsError_doNotCallInsertPosts() {
        // Given
        let repository = newRepository(withRemoteSuccess: false)
         
        // When
        repository.refreshPosts { }
         
        // Then
        XCTAssertEqual(local.isInsertPostsCalled, false)
    }
    
    func test_refreshPostsSuccess_callOnCompletion() {
        // Given
        let repository = newRepository(withRemoteSuccess: true)
        var isOnCompletionCalled = false
        
        // When
        repository.refreshPosts {
            isOnCompletionCalled = true
        }
        
        // Then
        XCTAssertEqual(isOnCompletionCalled, true)
    }
    
    func test_refreshPostsError_callOnCompletion() {
        // Given
        let repository = newRepository(withRemoteSuccess: false)
        var isOnCompletionCalled = false
        
        // When
        repository.refreshPosts {
            isOnCompletionCalled = true
        }
        
        // Then
        XCTAssertEqual(isOnCompletionCalled, true)
    }
    
    func test_getPosts_returnPosts() throws {
        // Given
        let repository = newRepository(withRemoteSuccess: true)
        let expected = [PostFactory.newPost()]
        
        // When
        let result = try repository.getPosts().toBlocking().first()
        
        // Then
        XCTAssertEqual(result, expected)
    }
    
    func test_deletePost_callLocalDeletePost() {
        // Given
        let repository = newRepository(withRemoteSuccess: true)
        
        // When
        repository.deletePost(post: PostFactory.newPost())
        
        // Then
        XCTAssertEqual(local.isDeletePostCalled, true)
    }
}
