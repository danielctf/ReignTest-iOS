//
//  GetPostsUseCaseProtocol.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import RxSwift

protocol GetPostsUseCaseProtocol {
    
    func execute() -> Observable<[Post]>
}
