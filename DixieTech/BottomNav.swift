//
//  BottomNav.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/19/26.
//

import SwiftUI

struct BottomNav: View {
    @State private var container = Container(
        defaults: .standard
    )
    
    var body: some View {
        TabView {
            Tab("Badge", systemImage: "person.text.rectangle") {
                StudentBadgeScreen(defaults: container.defaults)
                    .tint(nil) // Prevent taking the tint from the TabView
            }
        }
        .tint(Color.dtNavy)
        .colorScheme(.light) // Dixie Tech doesn't support a dark mode color scheme 😞
        .environment(\.container, container)
    }
}
