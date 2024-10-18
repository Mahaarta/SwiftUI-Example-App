//
//  RegisterVerifyView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 18/10/2024.
//

import SwiftUI

struct RegisterVerifyView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedLocation: String = Strings.chooseYourLocation.capitalized
    @State var phoneNumberStrings: String? = ""
    
    let locations: [String] = ["Indonesia", "Palestine", "Russia", "Malaysia", "Iran", "Lebanon"]
    
    var body: some View {
        BackButton()
        
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        /// Register title
                        Text(Strings.register.capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.bold(size: 40))
                            .multilineTextAlignment(.leading)
                            .padding(.vertical, 5)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        /// Group of description text
                        Group {
                            Text(Strings.pleaseEnterYour + " ") +
                            Text(Strings.phoneNumber.capitalized).font(.semiBold(size: 15)) +
                            Text(" " + Strings.or + "\n") +
                            Text(Strings.location.capitalized).font(.semiBold(size: 15)) +
                            Text(" " + Strings.soWeCanVerifyYou + " ")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.light(size: 15))
                        .lineLimit(3)
                        .padding(.bottom, 32)
                        .minimumScaleFactor(0.5)
                        
                        /// Enter your location
                        Group {
                            Text(Strings.enterYourLocation.capitalized)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.semiBold(size: 14))
                                .offset(y: 10)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            /// Dropdown choose location
                            Menu {
                                ForEach(locations, id: \.self) { location in
                                    Button {
                                        selectedLocation = location.capitalized
                                    } label: {
                                        Text(location.capitalized)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                    }
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(height: 56)
                                        .shadow(color: .black.opacity(0.1), radius: 13, x: 5, y: 7)
                                        .foregroundStyle(Color(UIColor.systemBackground))
                                    
                                    HStack {
                                        Text("🇮🇩")
                                            .frame(width: 40, alignment: .leading)
                                            .font(.system(size: 30))
                                            .padding(.leading, 16)
                                        
                                        Rectangle()
                                            .frame(width: 1, height: 30)
                                            .foregroundStyle(.gray.opacity(0.5))
                                        
                                        Text(selectedLocation)
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundStyle(Color(UIColor.label).opacity(0.7))
                                            .font(.regular(size: 14))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        
                                        Image(systemName: "chevron.down")
                                            .padding(.trailing, 16)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                        }
                        
                        /// Enter your phone number
                        Group {
                            TextFieldCustom(placeholder: Strings.enterYourPhoneNumber.capitalized, text: $phoneNumberStrings)
                        }

                        Spacer()
                        
                        /// Register button
                        Button {
                            dismiss()
                        } label: {
                            Text(Strings.register.capitalized)
                                .font(.bold(size: 17))
                                .foregroundStyle(.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(.brandPrimary)
                                .clipShape(.rect(cornerRadius: 12))
                                .dynamicTypeSize(.large ... .xxxLarge)
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
                        
                        /// Register with social media
                        HStack {
                            NavigationLink {
                                //
                            } label: {
                                Text(Strings.google.uppercased())
                                    .frame(height: 56)
                                    .frame(maxWidth: .infinity)
                                    .background(.grayCustom)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
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
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                        
                        Spacer()
                        
                        /// Already have an account
                        VStack(alignment: .leading ,spacing: 0) {
                            NavigationLink {
                                LoginView()
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
                    .padding(.horizontal, 24)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension RegisterVerifyView {
    struct Strings {
        static let register = localizedString(Localization.Register.register)
        static let pleaseEnterYour = localizedString(Localization.Register.pleaseEnterYour)
        static let or = localizedString(Localization.Application.or)
        static let toResetYourPassword = localizedString(Localization.ForgotPassword.toResetYourPassword)
        static let phoneNumber = localizedString(Localization.TextField.phoneNumber)
        static let location = localizedString(Localization.Register.location)
        static let enterYourPhoneNumber = localizedString(Localization.TextField.enterYourPhoneNumber)
        static let enterYourLocation = localizedString(Localization.TextField.enterYourLocation)
        static let next = localizedString(Localization.Application.next)
        static let google = localizedString(Localization.Application.google)
        static let facebook = localizedString(Localization.Application.facebook)
        static let soWeCanVerifyYou = localizedString(Localization.Verify.soWeCanVerifyYou)
        static let chooseYourLocation = localizedString(Localization.Register.chooseYourLocation)
        static let alreadyHaveAnAccount = localizedString(Localization.Register.alreadyHaveAnAccount)
        static let login = localizedString(Localization.Login.login)
    }
}

#Preview {
    RegisterVerifyView()
}
