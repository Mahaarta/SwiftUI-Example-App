//
//  TextFieldCustom.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 16/10/2024.
//

import SwiftUI

struct TextFieldCustom: View {
    var leftIcon: AnyView? = nil
    var rightIcon: AnyView? = nil
    var placeholder: String? = nil
    var isSecure: Bool = false
    var fieldBackgroundColor: Color? = nil
    var capsuleStyle: Bool = false
    //var onFocusChange: ((Bool) -> Void)? = nil

    @Binding var text: String?
    @FocusState private var isFocused: Bool?
    @State private var showPassword: Bool = false
    @State private var animationProgress: CGFloat = 0.0
    
    var body: some View {
        HStack {
            if let leftIcon = leftIcon {
                leftIcon
            }
            
            if isSecure && !showPassword {
                SecureField(
                    "",
                    text: Binding(
                        get: { text ?? "" },
                        set: { text = $0 }
                    ),
                    prompt: Text(placeholder ?? "")
                        .foregroundColor(.gray)
                        .font(.medium(size: 15))
                )
                .textContentType(.password)
                .font(.medium(size: 15))
                .foregroundColor(Color.textPrimary)
                .focused($isFocused, equals: true)
                
            } else {
                TextField(
                    "",
                    text: Binding(
                        get: { text ?? "" },
                        set: { text = $0 }
                    ),
                    prompt: Text(placeholder ?? "")
                        .foregroundColor(.gray)
                        .font(.medium(size: 15))
                )
                .font(.medium(size: 15))
                .foregroundColor(Color.textPrimary)
                .focused($isFocused, equals: true)
            }
            
            if isSecure {
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .resizable()
                        .frame(width: 19, height: 15)
                        .foregroundStyle(Color.gray)
                }
            } else if let rightIcon = rightIcon {
                rightIcon
            }
        }
        .frame(height: 34)
        .padding()
        .padding(.leading, 10)
        .background(
            ZStack {
                if capsuleStyle {
                    if let fieldBackgroundColor = fieldBackgroundColor {
                        Capsule()
                            .fill(isFocused != nil ? Color.brandPrimary.opacity(0.2) : fieldBackgroundColor)
                    } else {
                        if let _ = isFocused {
                            Capsule()
                                .fill(Color.brandPrimary.opacity(0.1))
                        } else {
                            Capsule()
                                .stroke(Color.separator, lineWidth: 1)
                        }
                    }
                } else {
                    if let fieldBackgroundColor = fieldBackgroundColor {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(fieldBackgroundColor)
                        
                    } else {
                        if let _ = isFocused {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.brandPrimary.opacity(0.1))
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.separator, lineWidth: 1)
                        }
                    }
                }
            }
        )
        .overlay {
            if capsuleStyle {
                Capsule()
                    .trim(from: 0, to: animationProgress)
                    .stroke(lineWidth: isFocused != nil ? 2 : 0)
                    .foregroundStyle(isFocused != nil ? Color.brandPrimary : Color.separator)
                    .animation(.easeInOut(duration: 0.5), value: animationProgress)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .trim(from: 0, to: animationProgress)
                    .stroke(lineWidth: isFocused != nil ? 2 : 0)
                    .foregroundStyle(isFocused != nil ? Color.brandPrimary : Color.separator)
                    .animation(.easeInOut(duration: 0.5), value: animationProgress)
            }
        }
        .onChange(of: isFocused ?? false) { newValue in
            withAnimation {
                animationProgress = newValue ? 1.0 : 0.0
            }
        }
    }
}


#Preview("No Value") {
    TextFieldCustom(
        leftIcon: AnyView(Image("icon-envelope")),
        rightIcon: AnyView(Image(systemName: "eye")),
        placeholder: "hallow",
        text: .constant("123")
    )
    .padding()
}
