//
//  WMAirQualityStatus.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

enum WMStatus: String, Decodable {
    case detected = "Detected"
    case confirmed = "Confirmed"
    case validated = "Validated"
    case notAnExceedance = "Not an Exceedance"

    var titleBackgroundColor: UIColor {
        switch self {
        case .detected:
            return WUITheme.WUIColor.green
        case .confirmed:
            return WUITheme.WUIColor.lightBlue
        case .validated:
            return WUITheme.WUIColor.darkBlue
        case .notAnExceedance:
            return WUITheme.WUIColor.grey
        }
    }

    var cardBackgroundColor: UIColor {
        switch self {
        case .detected:
            return WUITheme.WUIColor.green.withAlphaComponent(0.3)
        case .confirmed:
            return WUITheme.WUIColor.lightBlue.withAlphaComponent(0.3)
        case .validated:
            return WUITheme.WUIColor.darkBlue.withAlphaComponent(0.3)
        case .notAnExceedance:
            return WUITheme.WUIColor.grey.withAlphaComponent(0.3)
        }
    }
}

final class WMAirQualityStatus: Decodable {
    let title: String?
    let description: String?
    let status: WMStatus?

    init(title: String?, description: String?, status: WMStatus) {
        self.title = title
        self.description = description
        self.status = status
    }

    static func makeMockObject(status: WMStatus) -> WMAirQualityStatus {
        return .init(title: status.rawValue, description: "", status: status)
    }
}
