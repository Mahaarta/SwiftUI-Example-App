//
//  OnboardView.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 16/10/2024.
//

import SwiftUI

struct OnboardView: View {
    
    @State var currentStep: Int = 0
    @State var isAnimation: Bool = false
    @State private var isNavigating = false
    @State private var zoomed = false
    @State private var showWelcomeView = false
    
    private let images = [Image(.iconHandCoin), Image(.iconSackMoney), Image(.iconCoins)]
    private let titles = [Strings.takeHoldOfYourFinances, Strings.seeWhereYourMoneyIsGoing, Strings.reachYourGoalWithEase]
    private let subtitles = [Strings.runningYourFinanceEasyWith, Strings.stayOnTopByEffortlesslyTracking, Strings.useTheSmartSavingFeaturesToManage]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Text(Strings.skip.uppercased())
                        .font(.medium(size: 14))
                        .tracking(4)
                        .lineLimit(1)
                        .foregroundStyle(.textPrimary)
                        .minimumScaleFactor(0.1)
                        .dynamicTypeSize(.xxLarge ... .xxxLarge)
                        
                }
                
                ScrollView {
                    Group {
                        VStack {
                            ZStack {
                                Image(.iconOnboardBackground)
                                    .resizable()
                                    .frame(width: 282, height: 186)
                                    .scaledToFit()
                                    .offset(y: 40)
                                
                                images[currentStep]
                                    .resizable()
                                    .frame(width: 180, height: 180)
                                    .scaledToFit()
                            }
                            .padding(.bottom, 42)
                            
                            Group {
                                Text(titles[currentStep].capitalized)
                                    .font(.bold(size: 44))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.textPrimary)
                                    .padding(.bottom, 24)
                                    .lineLimit(2)
                                    .dynamicTypeSize(.large ... .xxxLarge)
                                
                                Text(subtitles[currentStep].capitalized)
                                    .font(.regular(size: 18))
                                    .foregroundStyle(.textPrimary)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .dynamicTypeSize(.large ... .xxxLarge)
                            }
                            .minimumScaleFactor(0.5)
                        }
                    }
                    .opacity(isAnimation ? 0 : 1)
                    .offset(x: isAnimation ? -20 : 0)
                    .animation(.easeInOut(duration: 0.5), value: isAnimation)
                }
                
                HStack {
                    HStack(spacing: 4) {
                        Text("\(currentStep + 1)")
                        Text("/")
                        Text("3")
                    }
                    .font(.medium(size: 14))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    Button {
                        if currentStep < titles.count - 1 {
                            isAnimation = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isAnimation = false
                                currentStep += 1
                            }
                        }
                        
                        if currentStep == 2 {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                zoomed = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                showWelcomeView = true
                            }
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 90, height: 90)
                                .foregroundStyle(.brandPrimary)
                            
                            Text(Strings.next.capitalized)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .font(.medium(size: 15))
                                .tracking(3)
                                .shadow(color: .brandPrimary.opacity(0.3), radius: 10, x: 9, y: 10)
                                .scaleEffect(zoomed ? 100 : 1)
                                .lineLimit(1)
                                .animation(.easeInOut(duration: 0.6), value: zoomed)
                                .minimumScaleFactor(0.3)
                        }
                    }
                    .navigationDestination(isPresented: $showWelcomeView) {
                        WelcomeView()
                    }
                }
                .padding()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        
    }
}

extension OnboardView {
    struct Strings {
        static let skip = localizedString(Localization.Application.skip)
        static let takeHoldOfYourFinances = localizedString(Localization.Landing.takeHoldOfYourFinances)
        static let seeWhereYourMoneyIsGoing = localizedString(Localization.Landing.seeWhereYourMoneyIsGoing)
        static let reachYourGoalWithEase = localizedString(Localization.Landing.reachYourGoalWithEase)
        
        static let runningYourFinanceEasyWith = localizedString(Localization.Landing.runningYourFinanceEasyWith)
        static let stayOnTopByEffortlesslyTracking = localizedString(Localization.Landing.stayOnTopByEffortlesslyTracking)
        static let useTheSmartSavingFeaturesToManage = localizedString(Localization.Landing.useTheSmartSavingFeaturesToManage)
        static let next = localizedString(Localization.Application.next)
    }
}


#Preview {
    OnboardView()
}
