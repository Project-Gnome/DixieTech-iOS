//
//  FormatStyle+TwoDigitDate.swift
//  DixieTech
//
//  Created by Lukas Simonson on 6/17/26.
//

import Foundation

extension FormatStyle where Self == Date.FormatStyle {
    static var twoDigitDate: Self {
        return .dateTime
            .day(.twoDigits)
            .month(.twoDigits)
            .year(.twoDigits)
    }
}
