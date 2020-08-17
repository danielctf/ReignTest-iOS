//
//  PostViewModelTest.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
@testable import ReignTest_iOS

class PostViewModelTest: XCTestCase {
    
    private let getPostsUseCase = GetPostsUseCaseFake()
    private let refreshPostsUseCase = RefreshPostsUseCaseFake()
    private let deletePostUseCase = DeletePostUseCaseFake()
    
    private var viewModel: PostViewModel!
    
    override func setUp() {
        viewModel = PostViewModel(
            getPostsUseCase: getPostsUseCase,
            refreshPostsUseCase: refreshPostsUseCase,
            deletePostUseCase: deletePostUseCase
        )
    }
    
    func test_init_callRefreshPostsUseCase() {
        // Then
        XCTAssertEqual(refreshPostsUseCase.isCalled, true)
    }
    
    func test_refreshPosts_callRefreshPostsUseCase() {
        // When
        viewModel.refreshPosts()
        
        // Then
        XCTAssertEqual(refreshPostsUseCase.isCalled, true)
        XCTAssertEqual(refreshPostsUseCase.timesCalled, 2)
    }
    
    func test_refreshPosts_setsLoading() {
        // Given
        let observer = TestObserver(on: viewModel.loading)
        
        // When
        viewModel.refreshPosts()
        
        // Then
        XCTAssertEqual(observer.items, [true, false])
    }
    
    func test_getPosts_returnPosts() throws {
        // Given
        let expected = [PostFactory.newPost()]
        
        // When
        let result = try viewModel.getPosts().toBlocking().first()
        
        // Then
        XCTAssertEqual(result, expected)
    }
    
    func test_deletePost_callDeletePostUseCase() {
        // When
        viewModel.deletePost(post: PostFactory.newPost())
        
        // Then
        XCTAssertEqual(deletePostUseCase.isCalled, true)
    }
    
    func test_postClickedWithInvalidUrl_setError() {
        // Given
        let post = PostFactory.newPost()
        post.storyUrl = nil
        post.url = nil
        let observer = TestObserver(on: viewModel.error)
        
        // When
        viewModel.postClicked(post: post)
        
        // Then
        XCTAssertEqual(observer.items.count, 1)
    }
    
    func test_postClickedWithValidUrl_setNavigateToDetails() {
        // Given
        let post = PostFactory.newPost()
        let observer = TestObserver(on: viewModel.navigateToDetails)
        
        // When
        viewModel.postClicked(post: post)
        
        // Then
        XCTAssertEqual(observer.items, [post.storyUrl])
    }
}
