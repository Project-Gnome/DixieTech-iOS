//
//  StudentIDScreen.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import SwiftUI

struct StudentIDScreen: View {
    
    @State private var viewModel: StudentIDVM
    
    init(defaults: UserDefaults) {
        viewModel = StudentIDVM(defaults: defaults)
    }
    
    var body: some View {
        if let id = viewModel.id {
            ScrollView {
                StudentIDCardView(
                    id: id,
                    barcodeImage: viewModel.barcodeImage
                )
                .padding()
            }
        } else {
            NavigationStack {
                StudentIDForm(
                    onCreateID: viewModel.setID
                )
            }
        }
    }
}

#Preview {
    StudentIDScreen(
        defaults: UserDefaults.standard
    )
}
