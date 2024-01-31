//
//  Modifiers.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/22/24.
//

import SwiftUI

struct OpenAnimation: ViewModifier {
    @Binding var launch: Bool
    let step: Int
    let totalSteps: Int
    
    func body(content: Content) -> some View {
        content
            .opacity(launch ? 1.0 : 0.0)
            .offset(y: launch ? 0 : UIDevice.bounds.height / 4)
            .animation(.spring().delay(launch ? 0.1 * Double(step) : Double(totalSteps - step) * 0.1), value: launch)
        
    }
}


struct TextFieldUserName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textContentType(.username)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .keyboardType(.emailAddress)   
    }
}
