//
//  Checkbox.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 17/10/2024.
//

import SwiftUI

struct Checkbox: View {
    
    @Binding var isChecked: Bool
    
    var width: CGFloat = 20
    var height: CGFloat = 20
    
    var body: some View {
        ZStack {
            Button {
                isChecked.toggle()
            } label: {
                RoundedRectangle(cornerRadius: self.width * 0.2)
                    .stroke(Color.brandPrimary, lineWidth: 2)
                    .frame(width: self.width, height: self.height)
                    .foregroundStyle(Color.grayCustom)
                    .background(isChecked ? .brandPrimary.opacity(0.4) : Color(UIColor.systemBackground))
                    .clipShape(.rect(cornerRadius: self.width * 0.2))
            }
            
            if isChecked {
                Image(systemName: "checkmark")
                    .frame(width: self.width - 16, height: self.height - 16)
                    .font(.system(size: self.width * 0.5))
                    .foregroundStyle(Color.brandPrimary)
                    .scaleEffect(isChecked ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.3), value: isChecked)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    Checkbox(isChecked: .constant(true), width: 200, height: 200)
        .padding()
}
