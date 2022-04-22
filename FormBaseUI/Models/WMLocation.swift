//
//  WMLocation.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import Foundation

final class WMLocation: Decodable {
    let name: String?
    let lat: Double?
    let lng: Double?

    init(name: String, lat: Double, lng: Double) {
        self.name = name
        self.lat = lat
        self.lng = lng
    }

    static func createMockObject() -> WMLocation {
        return .init(name: "Sawbones Bay", lat: 0.24445, lng: 1.2434)
    }
}
