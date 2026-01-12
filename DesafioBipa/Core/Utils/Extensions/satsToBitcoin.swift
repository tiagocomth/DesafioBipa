//
//  satsToBitcoin.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 12/01/26.
//

import Foundation

extension Int {
    
    static func satsToBitcoin(number: Int) -> String {
        let bitcoin = Decimal(number) / Decimal(100_000_000)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 8
        formatter.decimalSeparator = "."
        formatter.numberStyle = .decimal
        return formatter.string(from: NSDecimalNumber(decimal: bitcoin)) ?? "0.00000000"
    }
    
    static func unixToDateTime(unix: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unix))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
}
