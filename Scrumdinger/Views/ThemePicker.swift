//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Rosa Jeon on 2023-07-02.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        // The picker will display all available themes. You’ll make Theme conform to CaseIterable so that you can easily access all the enumeration’s cases.
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}


struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
