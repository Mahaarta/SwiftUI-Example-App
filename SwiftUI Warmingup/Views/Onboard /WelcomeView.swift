//
//  WelcomeView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 16/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandPrimary
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        Group {
                            VStack {
                                Image(.iconMoneySuitcase)
                                    .resizable()
                                    .frame(width: 350, height: 311)
                                    .scaledToFit()
                                    .padding(.top, 32)
                                
                                VStack(alignment: .leading) {
                                    Group {
                                        Text(Strings.welcome.capitalized)
                                            .font(.bold(size: 44))
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                        
                                        Text(Strings.stayOnTopByEffortlesslyTracking.capitalized)
                                            .font(.regular(size: 18))
                                            .foregroundStyle(.white)
                                            .lineLimit(3)
                                    }
                                    .minimumScaleFactor(0.5)
                                    .dynamicTypeSize(.large ... .xxxLarge)
                                }
                            }
                            .padding(.horizontal, 41)
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.white)
                            
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(.brandPrimary)
                                .frame(width: 100, height: 100)
                                .font(.system(size: 30))
                                .fontWeight(.medium)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension WelcomeView {
    struct Strings {
        static let welcome = localizedString(Localization.Landing.welcome)
        static let stayOnTopByEffortlesslyTracking = localizedString(Localization.Landing.stayOnTopByEffortlesslyTracking)
    }
}

#Preview {
    WelcomeView()
}
