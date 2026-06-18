//
//  DTProgram.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Foundation

enum DTProgram: String, CaseIterable, Comparable {
    // Computer Technologies
    case crm = "CRM Systems"
    case digitalDesign = "Digital Design"
    case drafting = "Drafting and Design"
    case it = "Information Technology"
    case mobileApp = "Mobile App Development"
    
    // Construction Technology
    case electricalResidential = "Electrical Residential"
    case electricalApprenticeship = "Electrical Apprenticeship"
    case hvacr = "HVACR Technician"
    case plumbingResidential = "Plumbing Residential"
    case plumbingApprenticeship = "Plumbing Apprenticeship"
    
    // Medical
    case advancedEMT = "Advanced EMT"
    case emt = "Emergency Medical Technician"
    case biotech = "Biotechnology"
    case fireFighter = "Firefighter"
    case medicalAssistant = "Medical Assistant"
    case nurseAssistant = "Nursing Assistant"
    case pharmacyTech = "Pharmacy Technician"
    case phlebotomyTech = "Phlebotomy Technician"
    case practicalNursing = "Practical Nursing"
    
    // Transportation Tech
    case autoTech = "Automotive Technology"
    case collisionRepair = "Collision Repair Technology"
    case cdlClassA = "CDL Class A"
    case cdlClassB = "CDL Class B"
    case dieselTech = "Diesel Technology"
    case heavyTech = "Heavy Equipment Technology"
    
    // Manufacturing Technology
    case machining = "Machining Technology"
    case welding = "Welding Technology"
    
    // Service Professions
    case culinary = "Culinary Arts"
    
    static func < (lhs: DTProgram, rhs: DTProgram) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
