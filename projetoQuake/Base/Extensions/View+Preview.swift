//
//  View+Preview.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 26/06/22.
//

import SwiftUI

struct PreviewComponentModifier: ViewModifier {
    
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewDisplayName(displayName)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    
    func preview(displayName: String = "") -> some View {
        self.modifier(PreviewComponentModifier(displayName: displayName))
    }
}
