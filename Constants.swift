//
//  Constants.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import SwiftUI

let VIEW_BG_COLOR = Color(hex: 0xF9F9F9)

let BUTTON_TEXT_COLOR = Color(hex: 0x1B1E1F)  // the pdf has this as FFFFFF in one spot, and 1B1E1F in another, so I went with the one that looks better

let HEADER_BACKGROUND = Color(uiColor: UIColor(named: "HeaderBackground") ?? UIColor(red: 15/255.0, green: 92/255.0, blue: 137/255.0, alpha: 1.000))

let HEADER_BACKGROUND_UICOLOR = UIColor(hex: 0x0E5C89)

let USER_MESSAGE_BG_COLOR = Color(hex: 0x00F9FC)

let HEADER_TEXT_COLOR = Color(hex: 0xFFFFFF)

let USER_MESSAGE_TEXT_COLOR = Color(hex: 0x1B1E1F)

let CHAT_BUBBLE_BORDER_COLOR = Color(hex: 0xEFEFEF)

func makeURLSecure(url: URL?) -> URL? {
    if let stringURL = url?.absoluteString {
        if stringURL[4] == "s" {
            return url
        } else {
            let newStringURL = "https\(stringURL.dropFirst(4) )"
            return URL(string: newStringURL)
        }
    }
    return nil
}


