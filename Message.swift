//
//  Message.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import Foundation

struct AllMessages: Codable {
  let data: [Message]
}

struct Message: Codable, Hashable {
    var userID: String
    var username: String
    var avatarURL: URL?
    var text: String
    
//    init(testName: String, withTestMessage message: String) {
//        self.userID = "0"
//        self.username = testName
//        self.avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png")
//        self.text = message
//    }
    
    private enum CodingKeys: String, CodingKey {
      case userID = "user_id"
      case username = "name"
      case avatarURL = "avatar_url"
      case text = "message"
    }
    
    
   
}
