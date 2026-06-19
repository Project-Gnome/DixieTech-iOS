//
//  Container.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/19/26.
//

import Foundation
import SwiftUI

struct Container {
    let defaults: UserDefaults
}

// Add container to the environment.
extension EnvironmentValues {
    @Entry var container: Container!
}
