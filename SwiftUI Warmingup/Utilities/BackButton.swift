//
//  BackButton.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 17/10/2024.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 47, height: 47)
                    .clipShape(.rect(cornerRadius: 15))
                    .foregroundStyle(Color(UIColor.systemBackground))
                    .shadow(color: Color(UIColor.label).opacity(colorScheme == .dark ? 0.3 : 0.1), radius: 14, x: 4, y: 2)
                
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color(UIColor.label))
                    .font(.regular(size: 14))
                    .minimumScaleFactor(0.5)
                    .dynamicTypeSize(.large ... .xxLarge)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    BackButton()
}
