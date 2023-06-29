//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-06-28.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

// this extension allows you to use the trailingIcon property to apply the TrailingIconLabelStyle to labels
extension LabelStyle where Self == TrailingIconLabelStyle {
    // static var named trailingIcon, with type of Self, returns the struct call to Self().
    static var trailingIcon: Self { Self() }
}
