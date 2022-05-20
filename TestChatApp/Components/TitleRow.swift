//
//  TitleRow.swift
//  TestChatApp
//
//  Created by Дмитрий Спичаков on 20.05.2022.
//

import SwiftUI

struct TitleRow: View {
    
    var imageUrl = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcvJ2DIfAqmlfYDM0csIS3rF_65v5VOf2EYkI6Bg5a7oJsl7TDuNHoT60UVDCDaak3-1Y&usqp=CAU")
    
    var name = "Fat Boy"
    
    var body: some View {
        HStack(spacing: 20) {
            
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .background(.gray)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
              
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
    }
}
