//
//  StudentIDCardView.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import SwiftUI

struct StudentIDCardView: View {
    let id: StudentIDCard
    let barcodeImage: UIImage?
    
    var body: some View {
        VStack(spacing: 16) {
            header
            barcode
            Divider()
            studentDetails
            VStack(spacing: 0) {
                Divider()
                footer
            }
        }
        .clipShape(.rect(cornerRadius: 15))
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(radius: 5)
        }
    }
    
    private var header: some View {
        HStack {
            Image(.DTX)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
                .padding(10) // Adds spacing around image, not standard
                .background(Color.white)
                .clipShape(.circle)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Dixie Technical College")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
                
                Text("Student ID Card")
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .foregroundStyle(Color.white)
                    .opacity(0.75)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.dtNavy)
    }
    
    @ViewBuilder
    private var barcode: some View {
        if let barcodeImage {
            VStack {
                Image(uiImage: barcodeImage)
                    .renderingMode(.template)
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(verbatim: String(id.id)) // Creates a String as a way to prevent number styling.
                    .font(.subheadline.monospaced())
                    .bold()
            }
            .foregroundStyle(Color.dtNavy)
        }
    }
    
    private var studentDetails: some View {
        VStack(alignment: .center) {
            Text(verbatim: id.name)
                .font(.title2)
                .bold()
            
            Text(id.program.rawValue)
                .font(.subheadline)
                .fontWeight(.light)
        }
        .padding(.horizontal)
    }
    
    private var footer: some View {
        HStack {
            Text("dixietech.edu")
            
            Spacer()
            
            Text("**Expires:** \(id.expiresAt, format: .twoDigitDate)")
        }
        .font(.footnote)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

#Preview {
    ScrollView {
        StudentIDCardView(
            id: StudentIDCard(
                id: 1234567890, // Fake 10 digit student id
                name: "Ryan Reynolds",
                program: .mobileApp,
                expiresAt: .now + 10000
            ),
            barcodeImage: try? Barcode.generate(for: 1234567890)
        )
        .padding()
    }
    .background(Material.thick)
}
