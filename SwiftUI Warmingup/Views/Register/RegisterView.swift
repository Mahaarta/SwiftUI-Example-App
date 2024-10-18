//
//  RegisterView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 17/10/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var fullNameString: String? = ""
    @State var emailString: String? = ""
    @State var passwordString: String? = ""
    @State var confirmPasswordString: String? = ""
    @State var checkboxIsChecked: Bool = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        /// Register title
                        VStack(alignment: .leading) {
                            Text(Strings.register.capitalized)
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
                            
                            Rectangle()
                                .frame(maxWidth: 100)
                                .frame(height: 1)
                                .foregroundStyle(Color.separator)
                        }
                        .padding(.vertical, 24)
                        
                        /// Text fields
                        VStack(spacing: 16) {
                            TextFieldCustom(placeholder: Strings.fullName.capitalized, text: $fullNameString)
                            TextFieldCustom(placeholder: Strings.enterEmailAddress.capitalized, text: $emailString)
                            TextFieldCustom(placeholder: Strings.password.capitalized, isSecure: true, text: $emailString)
                            TextFieldCustom(placeholder: Strings.confirmPassword.capitalized, isSecure: true, text: $confirmPasswordString)
                            
                            HStack(spacing: 3) {
                                Checkbox(isChecked: $checkboxIsChecked)
                                    .padding(.trailing, 6)
                                
                                Text(Strings.iveReadAndAgreeToTheTerms)
                                    .font(.regular(size: 12))
                                
                                NavigationLink(destination: EmptyView()) {
                                    Text(Strings.terms.capitalized)
                                        .bold()
                                        .foregroundStyle(.brandPrimary)
                                }
                                
                                Text(" & ")
                                    .font(.regular(size: 12))

                                NavigationLink(destination: EmptyView()) {
                                    Text(Strings.privacyPolicy.capitalized)
                                        .bold()
                                        .foregroundStyle(.brandPrimary)
                                }
                            }
                            .font(.regular(size: 12))
                            .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.05)
                        
                        /// Button
                        NavigationLink {
                            RegisterVerifyView()
                        } label: {
                            Text(Strings.next.capitalized)
                                .font(.bold(size: 17))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(.brandPrimary)
                                .clipShape(.rect(cornerRadius: 8))
                        }

                        
                        /// Already have an account
                        VStack(alignment: .leading ,spacing: 0) {
                            Button {
                                dismiss()
                            } label: {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(Strings.alreadyHaveAnAccount.capitalized + "?")
                                        .font(.regular(size: 14))
                                        .foregroundStyle(Color(UIColor.label))
                                    
                                    HStack(spacing: 12) {
                                        Text(Strings.login.capitalized)
                                            .font(.bold(size: 18))
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
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
    }
}

extension RegisterView {
    struct Strings {
        static let register = localizedString(Localization.Register.register)
        static let or = localizedString(Localization.Application.or)
        static let google = localizedString(Localization.Application.google)
        static let facebook = localizedString(Localization.Application.facebook)
        static let fullName = localizedString(Localization.TextField.fullName)
        static let enterEmailAddress = localizedString(Localization.TextField.enterEmailAddress)
        static let password = localizedString(Localization.TextField.password)
        static let confirmPassword = localizedString(Localization.TextField.confirmPassword)
        static let iveReadAndAgreeToTheTerms = localizedString(Localization.Application.iveReadAndAgreeToTheTerms)
        static let terms = localizedString(Localization.Application.terms)
        static let privacyPolicy = localizedString(Localization.Application.privacyPolicy)
        static let alreadyHaveAnAccount = localizedString(Localization.Register.alreadyHaveAnAccount)
        static let login = localizedString(Localization.Login.login)
        static let next = localizedString(Localization.Application.next)
    }
}

#Preview {
    RegisterView()
}
