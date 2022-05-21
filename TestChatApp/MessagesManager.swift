//
//  MessagesManager.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    // creating an instance of db
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error.localizedDescription)")
                    return nil
                }
            }
            // sort messages at newest to oldest
            self.messages.sort { $0.timestamp < $1.timestamp}
            // find last message to anchor it to the bottom
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            // prepare new message to send
            let newMessage = Message(
                id: "\(UUID())",
                text: text,
                received: false,
                timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch {
            print("Error adding message to Firestore: \(error.localizedDescription)")
        }
    }
    
}
