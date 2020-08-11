//
//  StringExtension.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/10/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

extension String {
    
    func localizedString(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
