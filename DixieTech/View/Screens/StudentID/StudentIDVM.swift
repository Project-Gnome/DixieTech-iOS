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
    var id: StudentIDCard?
    var barcodeImage: UIImage?
    
    func setID(_ newID: StudentIDCard) {
        do {
            id = newID
            barcodeImage = try Barcode.generate(for: newID.id)
        } catch {
            print(error)
        }
    }
}
