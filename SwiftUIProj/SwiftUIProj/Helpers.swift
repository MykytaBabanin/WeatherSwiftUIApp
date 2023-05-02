//
//  Helpers.swift
//  SwiftUIProj
//
//  Created by Mykyta Babanin on 29.04.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let purpleBackgroundColor = Color(red: 101 / 255.0, green: 78 / 255.0, blue: 146 / 255.0)
    static let blueBackgroundColor = Color(red: 138 / 255.0, green: 180 / 255.0, blue: 229 / 255.0)
}

extension Double {
    var toInt: Int { Int(self) }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(2)
    }
}


extension View {
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTap())
    }
}

struct DismissKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                dismissKeyboard()
            }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


