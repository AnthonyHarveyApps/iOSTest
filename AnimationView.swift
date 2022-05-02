//
//  AnimationView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//


import SwiftUI

struct AnimationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var fadedOut: Bool = false
    @State var rotationDegrees: Double = 0
    @State private var location: CGPoint = CGPoint(x: (UIScreen.width / 2) , y: 0)
    
    @GestureState var pinchScale1: CGFloat = 1.0
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil // 1
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location // 3
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                self.location = newLocation
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location // 2
            }
    }
    
    var fingerDrag: some Gesture {
        DragGesture()
            .updating($fingerLocation) { (value, fingerLocation, transaction) in
                fingerLocation = value.location
            }
    }
    
    var body: some View {
        ZStack {
            VIEW_BG_COLOR
            VStack {
                Spacer().frame(height: UIScreen.height / 5)
                Image("ic_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.width - 50)
                    .opacity(fadedOut ? 0 : 1)
                    .animation(.easeInOut(duration: 0.8), value: fadedOut)
                    .rotation3DEffect(.degrees(rotationDegrees), axis: (x: 0, y: 0, z: 1))
                    .onTapGesture {
                        print(position())
                        withAnimation(.easeInOut(duration: 1)) {
                            rotationDegrees += (Bool.random() ? 360 : -360)
                        }
                    }
                    .position(location)
                    .gesture(
                        simpleDrag.simultaneously(with: fingerDrag)
                    )
                    .scaleEffect(pinchScale1)
                    .gesture(MagnificationGesture()
                        .updating($pinchScale1, body: { (value, scale, trans) in
                            scale = value.magnitude
                        })
                    )

                Spacer()
                
                Text(fadedOut ? "FADE IN" : "FADE OUT")
                    .foregroundColor(.white)
                  //  .animation(.easeInOut(duration: 0.8), value: fadedOut)
                    .padding(20)
                    .background(Rectangle().foregroundColor(HEADER_BACKGROUND).frame(width: UIScreen.width - 60))
                    .onTapGesture {
                        fadedOut.toggle()
                    }
                    .padding()
            }

        }.navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Animation")
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
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
