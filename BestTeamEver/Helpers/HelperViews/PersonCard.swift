//
//  PersonCard.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import SwiftUI

struct Card: View {
    var text: String
    var imageName: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: width, height: height)
            Text(text)
                .font(Font.custom("BlackOpsOne-Regular", size: 17))
                .bold()
                .padding(.bottom)
                .foregroundColor(.primary)
        }
        .background(LinearGradient(colors: [.cyan, .pink, .orange], startPoint: .top, endPoint: .bottom).opacity(0.5))
        .cornerRadius(20)
        .shadow(color: Color.gray, radius: 10, x: 5, y: 3)
    }
}
