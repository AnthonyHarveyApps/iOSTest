//
//  MainView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//


import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    VStack(spacing: 24) {
                        
                        MainPageNavLink(title: "CHAT", imageName: "ic_chat", destination: AnyView(ChatView()))
                        
                        MainPageNavLink(title: "LOGIN", imageName: "ic_login", destination: AnyView(LoginView()))
                        
                        MainPageNavLink(title: "ANIMATION", imageName: "ic_animation", destination: AnyView(AnimationView()))
                        
                    }
                    Spacer()
                }
                .navigationTitle("")
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Coding Tasks")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(HEADER_TEXT_COLOR)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .tint(.white)
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundColor = HEADER_BACKGROUND_UICOLOR
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
            .background(Image("bg_home_menu").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: BonusView()) {
                            ZStack {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 80, height: 80)
                                Text("BONUS").foregroundColor(.white)
                                    .font(.subheadline)
                            }.shadow(color: .black, radius: 6, x: 1, y: 1)
                            
                        }.padding()
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
