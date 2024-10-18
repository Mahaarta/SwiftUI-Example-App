//
//  LoginView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 16/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailString: String? = ""
    @State private var passwordString: String? = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        /// Login title
                        VStack(alignment: .leading) {
                            Text(Strings.login.capitalized)
                                .font(.bold(size: 35))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        /// Login with social media
                        HStack {
                            NavigationLink {
                                //
                            } label: {
                                Text(Strings.google.uppercased())
                                    .frame(height: 56)
                                    .frame(maxWidth: .infinity)
                                    .background(.grayCustom)
                                    .foregroundColor(.textPrimary)
                                    .font(.regular(size: 14))
                                    .tracking(3)
                            }
                            
                            NavigationLink {
                                //
                            } label: {
                                Text(Strings.facebook.uppercased())
                                    .frame(height: 56)
                                    .frame(maxWidth: .infinity)
                                    .background(.grayCustom)
                                    .foregroundColor(.textPrimary)
                                    .font(.regular(size: 14))
                                    .tracking(3)
                            }
                        }
                        
                        /// OR Separator
                        HStack(spacing: 16) {
                            Rectangle()
                                .frame(maxWidth: 100)
                                .frame(height: 1)
                                .foregroundStyle(Color.separator)
                            
                            Text(Strings.or.lowercased())
                                .font(.regular(size: 14))
                                .foregroundStyle(.textPrimary)
                            
                            Rectangle()
                                .frame(maxWidth: 100)
                                .frame(height: 1)
                                .foregroundStyle(Color.separator)
                        }
                        .padding(.vertical, 24)
                        
                        /// Text fields
                        VStack(spacing: 16) {
                            TextFieldCustom(placeholder: Strings.enterEmailAddress.capitalized, text: $emailString)
                            
                            TextFieldCustom(
                                leftIcon: AnyView(Image("icon-lock")),
                                placeholder: Strings.password.capitalized,
                                isSecure: true,
                                text: $passwordString
                            )
                        }
                        
                        /// Forgot password
                        NavigationLink {
                            ForgotPasswordView()
                        } label: {
                            Text(Strings.forgotPassword.capitalized)
                                .foregroundStyle(.brandPrimary)
                                .font(.medium(size: 14))
                                .tracking(1)
                                .underline(color: .brandPrimary)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.vertical, 16)
                        }
                        
                        /// Login button
                        Button {
                        } label: {
                            Text(Strings.login.capitalized)
                                .font(.bold(size: 17))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(.brandPrimary)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                    }
                    .frame(minHeight: geometry.size.height - 64)
                    
                    /// Dont have an account
                    VStack(alignment: .leading ,spacing: 0) {
                        NavigationLink {
                            RegisterView()
                        } label: {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(Strings.dontHaveAnAccount.capitalized + "?")
                                    .font(.regular(size: 14))
                                    .foregroundStyle(Color(UIColor.label))
                                
                                HStack(spacing: 12) {
                                    Text(Strings.register.capitalized)
                                        .font(.bold(size: 17))
                                        .tracking(2)
                                        .foregroundStyle(.brandPrimary)
                                    
                                    Image(systemName: "arrow.forward")
                                        .frame(width: 10, height: 10)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.brandPrimary)
                                        .fontWeight(.heavy)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                }
            }
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
    }
}

extension LoginView {
    struct Strings {
        static let login = localizedString(Localization.Login.login)
        static let google = localizedString(Localization.Application.google)
        static let facebook = localizedString(Localization.Application.facebook)
        static let or = localizedString(Localization.Application.or)
        static let enterEmailAddress = localizedString(Localization.TextField.enterEmailAddress)
        static let password = localizedString(Localization.TextField.password)
        static let forgotPassword = localizedString(Localization.Login.forgotPassword)
        static let dontHaveAnAccount = localizedString(Localization.Login.dontHaveAnAccount)
        static let register = localizedString(Localization.Register.register)
    }
}

#Preview {
    LoginView()
}
