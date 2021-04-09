//
//  DateFormatter+Memo.swift
//  SwiftUIMemo
//
//  Created by Nayomi on 4/10/21.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
}

extension DateFormatter: ObservableObject {
    
}
