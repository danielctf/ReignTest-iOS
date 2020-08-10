//
//  PostRemoteDataSourceProtocol.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/7/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

protocol PostRemoteDataSourceProtocol {
    
    func getPosts(onCompletion: @escaping (Result<PostResponse>) -> Void)
}
