//
//  BonusView.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/30/22.
//

import SwiftUI
import SwiftUICharts

struct BonusView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Use of Swift Package 'Chart View'")
                        .font(.title3)
                        .bold()

                    VStack(alignment: .center) {
                        Text("Time spent on mobile (non-voice)").bold().multilineTextAlignment(.center)
                        MultiLineChartView(
                            data: [([1.05,1.02,1.14,1.16, 1.18],
                                    GradientColors.green),
                                   ([1.05,1.07,1.08,1.09, 1.1],
                                    GradientColors.purple),
                                   ([0.5,1,0.98,0.95,0.93],
                                    GradientColors.orngPink),
                                   ([0.4,0.44,0.48,0.52,0.56],
                                    GradientColors.bluPurpl)],
                            title: "2019-2022")
                        
                        Text("Other").foregroundColor(Color(hex: 0xA934C7))
                        Text("Audio").foregroundColor(Color(hex: 0x62E9CD))
                        Text("Social Networks").foregroundColor(Color(hex: 0xFF6B56))
                        Text("Video").foregroundColor(Color(hex: 0x7F49FA))
                        
                    }.padding()
                    Divider()
                    VStack(alignment: .center) {
                        Text("Top 5 App Categories on the App Store").bold().multilineTextAlignment(.center)
                        BarChartView(data: ChartData(values: [
                            ("Games",13.22),
                            ("Business",10.15),
                            ("Education",9.68),
                            ("Utilities",9.05),
                            ("Lifestyle",8.18)]),
                                     title: "% of total", legend: "").padding()
                    }.padding()
                }.padding()
            }
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("BONUS")
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

struct BonusView_Previews: PreviewProvider {
    static var previews: some View {
        BonusView()
    }
}
