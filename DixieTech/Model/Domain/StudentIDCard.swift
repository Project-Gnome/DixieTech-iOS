//
//  StudentIDCard.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Foundation

/// A data representation of the information found on a Student ID card
struct StudentIDCard: Identifiable {
    
    /// The students id, a 10 digit number representing the student.
    var id: Int
    
    /// The name of the student.
    var name: String?
    
    /// The program the student is enrolled in.
    var program: String?
    
    /// Where the students id image can be found at (local cache url)
    var imageURL: URL?
    
    /// When the student id expires.
    var expiresAt: Date?
}
