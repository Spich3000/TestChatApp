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
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
                
            }
            
        }
    }
    
}
