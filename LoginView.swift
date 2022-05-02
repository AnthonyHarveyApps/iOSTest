//
//  LoginView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//


import SwiftUI

enum AlertType {
    case error
    case success
    case none
}

struct LoginView: View, KeyboardReadable {
    @Environment(\.presentationMode) var presentationMode
    var vm = LoginViewViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var alertVisible: Bool = false
    @State var alertType: AlertType = .none
    @State var alertMessage = ""
    @State private var isKeyboardVisible = false
    @State var zoomedIn: Bool = false
    let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image("img_login")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(zoomedIn ? 1.5 : 1.1)
                .animation(.easeInOut(duration: 8), value: zoomedIn)
                .onReceive(timer) { _ in
                    zoomedIn.toggle()
                }
                .onAppear {
                    zoomedIn.toggle()
                }
            VStack(alignment: .center, spacing: 24) {
                
                Spacer().frame(height: isKeyboardVisible ? 144 : 64)
                    .animation(.easeIn, value: isKeyboardVisible)
                    .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                        print("Is keyboard visible? ", newIsKeyboardVisible)
                        isKeyboardVisible = newIsKeyboardVisible
                    }
                
                ZStack {
                    Rectangle().foregroundColor(.white).opacity(0.5)
                    TextField("email", text: $email)
                        .padding(.horizontal, 24)
                }.frame(width: UIScreen.width - 60, height: 55)
                
                
                ZStack {
                    Rectangle().foregroundColor(.white).opacity(0.5)
                    SecureField("password", text: $password)
                        .padding(.horizontal, 24)
                }.frame(width: UIScreen.width - 60, height: 55)
                
                
                Button {
                    if !email.isValidEmail {
                        alertType = .error
                        alertVisible = true
                        alertMessage = "You must enter a valid email"
                        return
                    }

                    vm.login(email: email, password: password, completion: { message in
                        print("done")
                        alertType = .success
                        alertVisible = true
                        alertMessage = message
                    }, error: {message in
                        
                        alertType = .error
                        alertVisible = true
                        alertMessage = message ?? "An error occured"
                    })
                    
                } label: {
                    Text("LOGIN")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Rectangle().foregroundColor(HEADER_BACKGROUND).frame(width: UIScreen.width - 60, height: 55))
                }
                    .padding()
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Login")
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
        
            .alert(isPresented: $alertVisible) {
                Alert (title: Text(alertType == .error ? "ERROR" : "COMPLETE"),
                       message: Text(alertMessage),
                       primaryButton: .default(Text("OK"), action: {
                    alertType = .none
                    presentationMode.wrappedValue.dismiss()
                }),
                       secondaryButton: .default(Text("Try Again")))
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
