//
//  MessageBubble.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    
    var body: some View {

        VStack(alignment: message.received ? .leading : .trailing) {
            
            HStack {
                
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("gray") : Color("mymessage"))
                    .cornerRadius(30)
                
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            
            Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(message.received ? .leading : .trailing, 10)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(
            id: "123",
            text: "Hello There!",
            received: false,
            timestamp: Date()))
    }
}
