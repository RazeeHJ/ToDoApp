//
//  MultiLineTextField.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/11/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct MultiLineTextField: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.textColor = .white
        textView.text = ""
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = UIColor.init(white: 0.15, alpha: 1.0)
        textView.tintColor = .white
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        var parent: MultiLineTextField
        
        init(_ uiTextView: MultiLineTextField) {
            self.parent = uiTextView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {    
            self.parent.text = textView.text
        }
    }
}

struct MultiLineTextField_Previews: PreviewProvider {
    static var test: String = ""
    static var testBinding = Binding<String>(get: { test },
                                             set: { test = $0 })
    
    static var previews: some View {
        VStack {
            MultiLineTextField(text: testBinding)
        }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
