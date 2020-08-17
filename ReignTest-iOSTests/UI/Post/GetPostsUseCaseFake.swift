//
//  GetPostsUseCaseFake.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift
@testable import ReignTest_iOS

class GetPostsUseCaseFake: GetPostsUseCaseProtocol {
    
    func execute() -> Observable<[Post]> {
        return Observable.just([PostFactory.newPost()])
    }
}
