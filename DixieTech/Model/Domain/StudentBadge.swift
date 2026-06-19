//
//  StudentBadge.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Foundation

/// A data representation of the information found on a Student Badge
struct StudentBadge: Identifiable, Codable {
    
    /// The students id, a 10 digit number representing the student.
    var id: Int
    
    /// The name of the student.
    var name: String
    
    /// The program the student is enrolled in.
    var program: DTProgram
    
    /// When the student id expires.
    var expiresAt: Date
}
