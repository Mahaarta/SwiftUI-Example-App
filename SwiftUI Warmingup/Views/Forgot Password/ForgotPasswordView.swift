//
//  ForgotPasswordView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 17/10/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var textfieldString: String? = ""
    
    var body: some View {
        BackButton()
        
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: geometry.size.height * 0.2)
                        
                        Text(Strings.forgotPassword.capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.bold(size: 40))
                            .padding(.vertical, 5)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .dynamicTypeSize(.large ... .xxLarge)
                        
                        Group {
                            Text(Strings.pleaseEnterYour + " ") +
                            Text(Strings.emailAddress.capitalized).font(.semiBold(size: 15)) +
                            Text(" " + Strings.or + "\n") +
                            Text(Strings.phoneNumber.capitalized).font(.semiBold(size: 15)) +
                            Text(" " + Strings.toResetYourPassword + " ")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.light(size: 15))
                        .padding(.bottom, 32)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                        .dynamicTypeSize(.large ... .xxxLarge)
                        
                        TextFieldCustom(
                            placeholder: Strings.enterEmailAddress.capitalized + "  " + Strings.or + " " + Strings.phoneNumber.capitalized,
                            text: $textfieldString
                        )
                        .padding(.bottom, 16)
                        
                        Button {
                        } label: {
                            Text(Strings.send.capitalized)
                                .font(.bold(size: 17))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(.brandPrimary)
                                .clipShape(.rect(cornerRadius: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .dynamicTypeSize(.large ... .xxLarge)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension ForgotPasswordView {
    struct Strings {
        static let forgotPassword = localizedString(Localization.ForgotPassword.forgotPassword)
        static let emailAddress = localizedString(Localization.Application.emailAddress)
        static let phoneNumber = localizedString(Localization.TextField.phoneNumber)
        static let enterEmailAddress = localizedString(Localization.TextField.enterEmailAddress)
        static let send = localizedString(Localization.Application.send)
        static let pleaseEnterYour = localizedString(Localization.Register.pleaseEnterYour)
        static let or = localizedString(Localization.Application.or)
        static let toResetYourPassword = localizedString(Localization.ForgotPassword.toResetYourPassword)
        
        static func pleaseEnterYourEmailOrPhoneNumberToResetPassword(variable: [String]) -> String {
            return localizedString(Localization.ForgotPassword.pleaseEnterYourEmailOrPhoneNumberToResetPassword, variable.first!, variable.last!)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
