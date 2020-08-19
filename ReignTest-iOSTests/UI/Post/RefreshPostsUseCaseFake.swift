//
//  RefreshPostsUseCaseFake.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
@testable import ReignTest_iOS

class RefreshPostsUseCaseFake: RefreshPostsUseCaseProtocol {
    
    var isCalled = false
    var timesCalled = 0
    
    func execute(onCompletion: @escaping () -> Void) {
        isCalled = true
        timesCalled += 1
        onCompletion()
    }
}
