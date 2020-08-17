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
    @objc dynamic var objectID: String = ""
    @objc dynamic var createdAt: Date?
    @objc dynamic var storyTitle: String?
    @objc dynamic var title: String?
    @objc dynamic var url: String?
    @objc dynamic var storyUrl: String?
    @objc dynamic var author: String?
    @objc private dynamic var privateActive: Int = Active.YES.rawValue
    
    var active: Active {
        get { return Active(rawValue: privateActive) ?? Active.NO }
        set { privateActive = newValue.rawValue }
    }
    
    func getTitle() -> String? {
        return storyTitle ?? title
    }
    
    func getUrl() -> String? {
        return storyUrl ?? url
    }
    
    override static func primaryKey() -> String? {
        return "objectID"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? Post else { return false }
        return objectID == other.objectID &&
            createdAt == other.createdAt &&
            storyTitle == other.storyTitle &&
            title == other.title &&
            url == other.url &&
            storyUrl == other.storyUrl &&
            author == other.author &&
            active == other.active
    }
    
    enum CodingKeys: String, CodingKey {
        case objectID, title, url, author
        case createdAt = "created_at"
        case storyTitle = "story_title"
        case storyUrl = "story_url"
    }
}
