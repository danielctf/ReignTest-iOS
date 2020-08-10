//
//  TagExtension.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/7/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import UIKit

protocol Tag {
    static var TAG: String { get }
}

extension Tag {
    static var TAG: String {
        return String(describing: self)
    }
}

extension UIViewController: Tag {}

extension UITableViewCell: Tag {}
