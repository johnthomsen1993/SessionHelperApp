//
//  ColorHelper.swift
//  SessionHelperApp
//
//  Created by John Thomsen on 20/04/2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xff0000) >> 16) / 255
        let g = Double((rgbValue & 0xff00) >> 8) / 255
        let b = Double(rgbValue & 0xff) / 255
        self.init(red: r, green: g, blue: b)
    }
}
