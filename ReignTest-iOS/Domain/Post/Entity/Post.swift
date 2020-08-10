//
//  Post.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 7/31/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object, Decodable {
    
    // Realm objects MUST be '@objc dynamic var', they cannot be '@objc dynamic let'
    @objc dynamic var objectID: String
    @objc dynamic var createdAt: String
    @objc dynamic var storyTitle: String?
    @objc dynamic var title: String?
    @objc dynamic var url: String?
    @objc dynamic var storyUrl: String?
    @objc private dynamic var privateActive: Int = Active.YES.rawValue
    
    var active: Active {
        get { return Active(rawValue: privateActive) ?? Active.NO }
        set { privateActive = newValue.rawValue }
    }
    
    func getTitle() -> String? {
        return storyTitle ?? title
    }
    
    override static func primaryKey() -> String? {
        return "objectID"
    }
    
    enum CodingKeys: String, CodingKey {
        case objectID, title, url
        case createdAt = "created_at"
        case storyTitle = "story_title"
        case storyUrl = "story_url"
    }
}
