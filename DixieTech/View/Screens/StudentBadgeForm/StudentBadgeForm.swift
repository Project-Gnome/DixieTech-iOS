//
//  StudentBadgeForm.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import AVFoundation
import CodeScanner
import SwiftUI

struct StudentBadgeForm: View {
    
    @State private var viewModel = StudentBadgeFormVM()
    @State private var showScanner = false
    
    let onCreateBadge: (StudentBadge) -> Void
    
    private var validGraduationRange: ClosedRange<Date> {
        Date()...(Date() + 63_113_904) // Up to two years from today
    }
    
    var body: some View {
        Form {
            studentInfoSection
            programInfoSection
        }
        .navigationTitle("Add a Student ID")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Done") {
                    if let idCard = viewModel.validate() {
                        onCreateBadge(idCard)
                    }
                }
            }
        }
        .sheet(isPresented: $showScanner) {
            CodeScannerView(codeTypes: [.codabar, .code39, .code39Mod43, .code93, .code128]) { result in
                switch result {
                    case .success(let success):
                        if let idNumber = Int(success.string) {
                            viewModel.studentID = String(idNumber)
                        } else {
                            print("Invalid Barcode")
                        }
                    case .failure(let failure):
                        print(failure)
                }
                showScanner = false
            }
        }
    }
    
    private var studentInfoSection: some View {
        Section("Student Info") {
            VStack(alignment: .leading) {
                HStack {
                    TextField("Student ID", text: $viewModel.studentID)
                        .keyboardType(.numberPad)
                    
                    Button("Scan your ID", systemImage: "barcode.viewfinder") {
                        showScanner = true
                    }
                    .font(.title2)
                    .labelStyle(.iconOnly)
                }
            }
            
            if !viewModel.studentIDIssues.isEmpty {
                VStack {
                    ForEach(viewModel.studentIDIssues, id: \.self) { issue in
                        Text(issue)
                            .font(.footnote)
                            .foregroundStyle(Color.dtError)
                    }
                }
            }
            
            TextField("Name", text: $viewModel.name)
            
            if !viewModel.nameIssues.isEmpty {
                VStack {
                    ForEach(viewModel.nameIssues, id: \.self) { issue in
                        Text(issue)
                            .font(.footnote)
                            .foregroundStyle(Color.dtError)
                    }
                }
            }
        }
    }
    
    private var programInfoSection: some View {
        Section("Program Info") {
            Picker("Program", selection: $viewModel.program) {
                ForEach(DTProgram.allCases.sorted(), id: \.self) { program in
                    Text(program.rawValue)
                }
            }
            
            VStack {
                DatePicker(
                    "Graduation Date",
                    selection: $viewModel.graduation,
                    in: validGraduationRange,
                    displayedComponents: .date
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        StudentBadgeForm(
            onCreateBadge: { _ in
                
            }
        )
    }
}
