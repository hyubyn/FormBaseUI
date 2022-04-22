//
//  String+.swift
//  wbea
//
//  Created by Hyubyn on 18/04/2022.
//

import Foundation

extension String {
    var htmlWrappedString: String {
        return """
        <style>
        @font-face
        {
            font-family: 'Muli';
            font-weight: normal;
            src: url(Muli.ttf);
        }
        </style>
        <meta name="viewport" content="initial-scale=1.0" />
        <span style="font-family: 'Muli'; font-weight: normal; font-size: 14; color:#5D5D5D">\(self)</span>
        """
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func addPercentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }

    func toDate(format: String = "MMMM d, yyyy hh:mm") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.date(from: self)
    }
    
}
