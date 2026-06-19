//
//  Barcode.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

enum Barcode {
    /// Generates a barcode image with no background based on the provided integer input.
    ///
    /// Non-isolated to allow calling on a background thread.
    static nonisolated func generate(for input: Int) throws -> UIImage {
        let context = CIContext()
        let generator = CIFilter.code128BarcodeGenerator()
        generator.message = Data(String(input).utf8)
        
        // Creates the barcode image, then applies filters to remove the background.
        guard let barcode = generator.outputImage?
            .applyingFilter("CIColorInvert")
            .applyingFilter("CIMaskToAlpha")
        else { throw GenerationError.failedToGenerateRawBarcodeImage }
        
        // Converts the raw image data into a useable image, insetting the image to remove excess space.
        guard let cgImage = context.createCGImage(barcode, from: barcode.extent.insetBy(dx: 0, dy: 18))
        else { throw GenerationError.failedToConvertRawBarcode }
        
        return UIImage(cgImage: cgImage)
    }
    
    enum GenerationError: Error {
        case failedToGenerateRawBarcodeImage
        case failedToConvertRawBarcode
    }
}
