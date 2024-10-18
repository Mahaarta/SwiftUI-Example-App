//
//  Font.swift
//  SwiftUI Warmingup
//
//  Created by Minata on 15/10/2024.
//

import SwiftUI

extension Font {
    
    static func thin(size: CGFloat) -> Font {
        .custom("Poppins-thin", size: size)
    }
    
    static func light(size: CGFloat) -> Font {
        .custom("Poppins-light", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        .custom("Poppins-Regular", size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        .custom("Poppins-Medium", size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        .custom("Poppins-SemiBold", size: size)
    }
    
    static func bold(size: CGFloat) -> Font {
        .custom("Poppins-Bold", size: size)
    }
    
    static func italic(size: CGFloat) -> Font {
        .custom("Poppins-Italic", size: size)
    }
    

//    static func h1() -> Font {
//        .custom("Inter-Bold", size: 22)
//    }
//    
//    static func h2() -> Font {
//        .custom("Inter-Bold", size: 17)
//    }
//    
//    static func h3() -> Font {
//        .custom("Inter-Bold", size: 15)
//    }
//    
//    static func p1() -> Font {
//        .custom("Inter-Medium", size: 17)
//    }
//    
//    static func p2() -> Font {
//        .custom("Inter-Medium", size: 15)
//    }
//    
//    static func s() -> Font {
//        .custom("Inter-Medium", size: 12)
//    }
//    
//    static func semiBoldz(size: CGFloat) -> Font {
//        .custom("Inter-Bold", size: 20)
//    }
}

#Preview("Bold", body: {
    List {
        Text("Thin")
            .font(.thin(size: 42))
        
        Text("Light")
            .font(.light(size: 42))
        
        Text("Regular")
            .font(.regular(size: 42))
        
        Text("Medium")
            .font(.medium(size: 42))
        
        Text("SemiBold")
            .font(.semiBold(size: 42))
        
        Text("Bold")
            .font(.bold(size: 42))
        
        Text("Italic")
            .font(.italic(size: 42))
        
    }
})
