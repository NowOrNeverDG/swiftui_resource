//
//  KeyboardResponder.swift
//  MrPoDemo
//
//  Created by Ge Ding on 2/19/21.
//

import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    var keyboardShow: Bool { keyboardHeight > 0}
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
//    //IOS9之前必须写，不然crush
//    deinit {  
//        NotificationCenter.default.removeObserver(self)
//    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return//以保证输出frame是CGRect
        }
        keyboardHeight = frame.height
    }
    
    @objc private func keyboardWillHidden(_ notification: Notification) {
        keyboardHeight = 0
        
    }
}
