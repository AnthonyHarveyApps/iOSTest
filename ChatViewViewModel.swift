//
//  ChatViewViewModel.swift
//  iOS Rapptr Test SWIFTUI HARVEY
//
//  Created by Anthony Harvey on 4/29/22.
//

import Foundation
import Combine
import UIKit

class ChatViewViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing = false
    var cancellable: AnyCancellable? = nil
    func fetch() {
        guard let url = URL(string: "https://dev.rapptrlabs.com/Tests/scripts/chat_log.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let allMessages = try JSONDecoder().decode(AllMessages.self, from: data)
                DispatchQueue.main.async {
                    self?.messages = allMessages.data
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
    
}
