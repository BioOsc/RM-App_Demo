//
//  ScrollView+Offset.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}
