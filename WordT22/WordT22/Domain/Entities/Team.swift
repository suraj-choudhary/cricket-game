//
//  Team.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public struct Team: Identifiable, Equatable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let flagUrl: URL?
    public let isoCode: String
    
    init(
        id: String? = nil,
        name: String,
        flagUrl: URL?,
        isoCode: String = ""
    ) {
        self.id = id ?? name
        self.name = name
        self.flagUrl = flagUrl
        self.isoCode = isoCode
    }
}
