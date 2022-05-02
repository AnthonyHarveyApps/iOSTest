//
//  ChatView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import SwiftUI

struct ChatView: View {
    var userID = "2022"
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = ChatViewViewModel()
    @State private var typingMessage = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    var body: some View {
     
            ZStack(alignment: .top) {
                VIEW_BG_COLOR
                VStack {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        ScrollViewReader { proxy in
                            LazyVStack(alignment: .leading, spacing: 21) {
                                Spacer().frame(height: 16)
                                ForEach(vm.messages.indices, id: \.self) { index in
                                    let message = vm.messages[index]
                                    
                                    if userID == message.userID {
                                        MessageFromUserView(avatarURL: message.avatarURL, text: message.text)
                                    } else {
                                        
                                        MessageView(avatarURL: message.avatarURL, name: message.username, text: message.text)
                                    }
                                }
                            }.padding(.trailing, 16)
                                .padding(.leading, 16)
                                .onAppear {
                                    vm.fetch()
                                    scrollProxy = proxy
                                }
                        }
                    })
                    ZStack(alignment: .trailing) {
                        Color.white
                        TextField("Type a message", text: $typingMessage)
                            .foregroundColor(Color.black)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(height: 45)
                            .padding()
                        
                        Button {
                            sendMessage()
                        } label: {
                            Text("Send")
                        }.padding(.horizontal)
                            .foregroundColor(typingMessage.isEmpty ? .gray : .blue)
                    }.frame(height: 40)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .padding(.horizontal)
                        .padding(.bottom)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("CHAT")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(HEADER_TEXT_COLOR)
                }
                
                ToolbarItem(placement: .navigation) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }

            }
                    .onChange(of: vm.keyboardIsShowing) { value in
                        if value {
                            scrollToTheBottom()
                        }
                    }.onChange(of: vm.messages, perform: { _ in
                        scrollToTheBottom()
                })
        
    }
    func sendMessage() {
        vm.messages.append(Message(userID: "2022", username: "Anthony", avatarURL: URL(string: "https://i.imgur.com/daSMRF3.jpg"), text: typingMessage))
        typingMessage = ""
        scrollToTheBottom()
    }
    
    func scrollToTheBottom() {
        withAnimation {
                  scrollProxy?.scrollTo(vm.messages.count - 1, anchor: .bottom)
        }
    }  
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
