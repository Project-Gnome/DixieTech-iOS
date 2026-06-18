//
//  DixieTechApp.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/12/26.
//

import SwiftUI

@main
struct DixieTechApp: App {
    var body: some Scene {
        WindowGroup {
            Image(.dtMainLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .background(Color.dtNavy)
        }
    }
}
