//
//  Message.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import Foundation

struct Message: Identifiable, Codable {
    
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
    
}
