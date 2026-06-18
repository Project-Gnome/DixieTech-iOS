//
//  StudentIDVM.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Observation
import UIKit

@Observable
final class StudentIDVM {
    
    // MARK: Using UserDefaults for storage here, could be done with keychain for better security.
    // Focusing on simplicity for the time being but would be good to reevaluate later.
    private var defaults: UserDefaults
    
    var id: StudentIDCard?
    var barcodeImage: UIImage?
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
        
        do {
            if let data = defaults.data(forKey: StudentIDVM.cardDefaultsKey) {
                let card = try JSONDecoder().decode(StudentIDCard.self, from: data)
                try updateID(card)
            }
        } catch {
            print("Error reloading student id card: \(error)")
        }
    }
    
    func setID(_ newID: StudentIDCard) {
        do {
            try updateID(newID)
            let data = try JSONEncoder().encode(newID)
            defaults.set(data, forKey: StudentIDVM.cardDefaultsKey)
        } catch {
            print("Error setting student id card: \(error)")
        }
    }
    
    private func updateID(_ id: StudentIDCard) throws {
        self.id = id
        self.barcodeImage = try Barcode.generate(for: id.id)
    }
}

extension StudentIDVM {
    static let cardDefaultsKey = "STUDENT_ID"
}
