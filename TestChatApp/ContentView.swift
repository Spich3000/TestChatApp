//
//  ContentView.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    var messageArray = ["Hello, boy!", "What is going on!?", "I'm making an App, Dude! Call you later!"]
    
    var body: some View {
        
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(
                            id: "123",
                            text: text,
                            received: true,
                            timestamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
            }
            .background(Color("gray"))
            
            MessageField()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
