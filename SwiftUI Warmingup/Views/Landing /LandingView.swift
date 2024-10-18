//
//  LandingView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 15/10/2024.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandPrimary
                    .ignoresSafeArea()
                
                VStack {
                    Image(.iconWallet)
                        .resizable()
                        .frame(width: 135, height: 145)
                        .foregroundColor(.white)
                    
                    Group {
                        Text(Strings.wallet.capitalized)
                            .font(.bold(size: 65))
                        
                        Text(Strings.moneyTransferWallet.capitalized)
                            .font(.regular(size: 18))
                    }
                    .foregroundStyle(.white)
                    
                    NavigationLink {
                        OnboardView()
                    } label: {
                        Text(Strings.getStarted.capitalized)
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 12))
                            .foregroundColor(.brandPrimary)
                            .font(.bold(size: 18))
                            .padding(.horizontal, 32)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension LandingView {
    struct Strings {
        static let wallet = localizedString(Localization.Application.wallet)
        static let moneyTransferWallet = localizedString(Localization.Landing.moneyTransferWallet)
        static let getStarted = localizedString(Localization.Application.getStartedNow)
    }
}

#Preview {
    LandingView()
}
