//
//  RMBackground.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct RMBackground<Content>: View where Content: View {
    
    var content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(content: {
            //MARK: Add additional config for general usage
            content()
        })
    }
}

#Preview {
    RMBackground(content: {
        VStack(content: {
            
        })
    })
}
