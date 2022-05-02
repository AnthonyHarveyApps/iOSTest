//
//  MainPageNavLink.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import SwiftUI

struct MainPageNavLink: View {
    let title: String
    let imageName: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink {
           destination
        } label: {
            Spacer().frame(width: 22)
            HStack(alignment: .top, spacing: 16) {
                Image(imageName)
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(BUTTON_TEXT_COLOR)
                Spacer()
            }.padding()
        }.background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white).opacity(0.8).frame(width: UIScreen.width - 30))
    }
}

struct MainPageNavLink_Previews: PreviewProvider {
    static var previews: some View {
        MainPageNavLink(title: "CHAT", imageName: "ic_chat", destination: AnyView(ChatView()))
    }
}
