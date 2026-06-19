//
//  StudentIDVM.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Observation
import UIKit

@Observable
final class StudentBadgeVM {
    
    // MARK: Using UserDefaults for storage here, could be done with keychain for better security.
    // Focusing on simplicity for the time being but would be good to reevaluate later.
    private var defaults: UserDefaults
    
    var badge: StudentBadge?
    var barcodeImage: UIImage?
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
        
        do {
            if let data = defaults.data(forKey: StudentBadgeVM.cardDefaultsKey) {
                let badge = try JSONDecoder().decode(StudentBadge.self, from: data)
                try update(badge)
            }
        } catch {
            print("Error reloading student badge: \(error)")
        }
    }
    
    func set(_ newBadge: StudentBadge) {
        do {
            try update(newBadge)
            let data = try JSONEncoder().encode(newBadge)
            defaults.set(data, forKey: StudentBadgeVM.cardDefaultsKey)
        } catch {
            print("Error setting student badge: \(error)")
        }
    }
    
    func delete() {
        self.badge = nil
        self.barcodeImage = nil
        defaults.removeObject(forKey: StudentBadgeVM.cardDefaultsKey)
    }
    
    private func update(_ badge: StudentBadge) throws {
        self.badge = badge
        self.barcodeImage = try Barcode.generate(for: badge.id)
    }
}

extension StudentBadgeVM {
    static let cardDefaultsKey = "STUDENT_BADGE"
}
