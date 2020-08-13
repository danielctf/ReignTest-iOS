//
//  PostTableViewCell.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postInformation: UILabel!
    
    func setPost(post: Post) {
        postTitle.text = post.getTitle() ?? Localizable.NO_TITLE
        postInformation.text =
            (post.author ?? Localizable.NO_AUTHOR) +
            " - " +
            RelativeDateTimeFormatter().localizedString(for: post.createdAt, relativeTo: Date())
    }
}
