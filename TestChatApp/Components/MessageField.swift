//
//  MessageField.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messagesManager: MessagesManager
    
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter you message"), text: $message)
            
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("mymessage"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
        
    }
    
}
