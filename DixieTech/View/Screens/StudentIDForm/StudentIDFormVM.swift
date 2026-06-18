//
//  StudentIDFormVM.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Foundation
import Observation

@Observable
final class StudentIDFormVM {
    var studentID = ""
    var name = ""
    var program = DTProgram.mobileApp
    var graduation = Date.now + 31_556_952
    
    private(set) var studentIDIssues = [String]()
    private(set) var nameIssues = [String]()
    
    func validate() -> StudentIDCard? {
        validateStudentID()
        validateName()
        
        guard studentIDIssues.isEmpty && nameIssues.isEmpty
        else { return nil }
        
        return StudentIDCard(
            id: Int(studentID)!, // safe, confirmed by validateStudentID
            name: name,
            program: program,
            expiresAt: graduation
        )
    }
    
    private func validateStudentID() {
        studentIDIssues = []
        
        guard let idNumber = Int(studentID)
        else { return studentIDIssues.append("Must be a valid 10 digit number") }
        
        guard 1000000000 <= idNumber && idNumber <= 9999999999
        else { return studentIDIssues.append("Must be a 10 digit number") }
    }
    
    private func validateName() {
        nameIssues = []
        
        name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name.isEmpty {
            nameIssues.append("Must not be empty")
        }
    }
}
