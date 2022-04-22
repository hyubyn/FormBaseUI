//
//  WMAirQuality.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import Foundation

final class WMAirQuality: Decodable {
    let location: WMLocation?
    let status: WMAirQualityStatus?
    let dateString: String?
    let pollutant: String?
    let concentration: String?
    let type: String?

    var date: Date? {
        return dateString?.toDate()
    }

    init(location: WMLocation, status: WMAirQualityStatus, dateString: String, pollutant: String, concentration: String, type: String) {
        self.location = location
        self.status = status
        self.dateString = dateString
        self.pollutant = pollutant
        self.concentration = concentration
        self.type = type
    }

    static func makeMockObject(status: WMStatus) -> WMAirQuality {
        return .init(location: .createMockObject(), status: .makeMockObject(status: status), dateString: "March 17, 2022 18:00", pollutant: "H2S", concentration: "11 ppb", type: "AAAQO")
    }
}
