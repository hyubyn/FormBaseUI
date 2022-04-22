//
//  WLogs.swift
//  wbea
//
//  Created by Hyubyn on 18/04/2022.
//

final class WLogs {
    static func log(_ message: Any) {
        #if DEBUG
        print(message)
        #endif
    }
}
