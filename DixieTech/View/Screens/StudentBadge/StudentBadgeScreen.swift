//
//  StudentIDScreen.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import SwiftUI

struct StudentBadgeScreen: View {
    
    @State private var viewModel: StudentBadgeVM
    
    init(defaults: UserDefaults) {
        viewModel = StudentBadgeVM(defaults: defaults)
    }
    
    var body: some View {
        NavigationStack {
            if let badge = viewModel.badge {
                ScrollView {
                    StudentBadgeView(
                        badge: badge,
                        barcodeImage: viewModel.barcodeImage,
                        onDelete: viewModel.delete
                    )
                    .padding()
                }
            } else {
                StudentBadgeForm(
                    onCreateBadge: viewModel.set
                )
            }
        }
    }
}

#Preview {
    StudentBadgeScreen(
        defaults: UserDefaults.standard
    )
}
