//
//  TestObserver.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class TestObserver<T> {
    
    var items = [T]()
    private let disposeBag = DisposeBag()
    
    init(on subject: PublishSubject<T>) {
        subject.subscribe(onNext: { value in
            self.items.append(value)
        }).disposed(by: disposeBag)
    }
}
