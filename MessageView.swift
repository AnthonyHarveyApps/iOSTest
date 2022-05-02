//
//  MessageView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import SwiftUI

struct MessageView: View {
    var avatarURL: URL?
    let name: String
    let text: String
    var body: some View {
        
        HStack(alignment: .top, spacing: 7) {
            AsyncImage(url:makeURLSecure(url: avatarURL)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .clipShape(Circle())
            .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: 2) {
                
                Text(name).foregroundColor(USER_MESSAGE_TEXT_COLOR)
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.leading, 4)
                HStack {
                    Text(text)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(hex: 0x1B1E1F))
                    Spacer()
                }.padding(8)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 8).foregroundColor(.white)
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 0.2)
                                .foregroundColor(CHAT_BUBBLE_BORDER_COLOR)
                        }
                    )
                    .padding(.trailing, 20)
            }.padding(.top, 3)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(avatarURL: URL(string: "https://dev.rapptrlabs.com/Tests/images/abby_avatar.png")!, name: "Anthony", text: "This is a test. It's only a test. It's a test message in a test app")
            .frame(width: UIScreen.width - 36, height: 70)
            .background(VIEW_BG_COLOR)
    }
}

//MARK: - This is for messages that come from the user (image on right, light blue bubble)
struct MessageFromUserView: View {
    let avatarURL: URL?
    let text: String
    var body: some View {
        
        HStack(alignment: .top, spacing: 7) {
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                
                Text("Me").foregroundColor(Color(hex: 0x1B1E1F))
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.trailing, 4)
                
                Text(text)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(hex: 0x1B1E1F))
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 8).foregroundColor(USER_MESSAGE_BG_COLOR))
                    .padding(.leading, 20)
            }
            AsyncImage(url:makeURLSecure(url: avatarURL)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .clipShape(Circle())
            .frame(width: 44, height: 44)
        }
    }
}

struct MessageFromUserView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(avatarURL: URL(string: "https://dev.rapptrlabs.com/Tests/images/abby_avatar.png")!, name: "Anthony", text: "This is a test. It's only a test. It's a test message in a test app")
            .frame(width: UIScreen.width - 36, height: 70)
            .background(VIEW_BG_COLOR)
    }
}
