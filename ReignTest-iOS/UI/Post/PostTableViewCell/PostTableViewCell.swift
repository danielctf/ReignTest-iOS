//
//  PostTableViewCell.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/5/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storyTitle: UILabel!
    
    func setPost(post: Post) {
        storyTitle.text = post.getTitle()
    }
}
