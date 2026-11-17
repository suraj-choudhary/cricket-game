//
//  LocalTeamDataSource.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public struct LocalTeamDataSource: Sendable {
    public init() {}
    
    public func loadTeam() async throws -> [TeamDTO] {
        
        if let url = Bundle.main.url(forResource: "team", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            return try JSONDecoder().decode([TeamDTO].self, from: data)
        }
        let fallBackData = Data(Self.bundledJSONFallback.utf8)
        return try JSONDecoder().decode([TeamDTO].self, from: fallBackData)
    }
    
    private static let bundledJSONFallback = """
    [
      { "name": "Afghanistan", "flag": "https://flagcdn.com/w160/af.png", "isoCode": "AF" },
      { "name": "Australia", "flag": "https://flagcdn.com/w160/au.png", "isoCode": "AU" },
      { "name": "Bangladesh", "flag": "https://flagcdn.com/w160/bd.png", "isoCode": "BD" },
      { "name": "England", "flag": "https://flagcdn.com/w160/gb-eng.png", "isoCode": "GB-ENG" },
      { "name": "India", "flag": "https://flagcdn.com/w160/in.png", "isoCode": "IN" },
      { "name": "New Zealand", "flag": "https://flagcdn.com/w160/nz.png", "isoCode": "NZ" },
      { "name": "Pakistan", "flag": "https://flagcdn.com/w160/pk.png", "isoCode": "PK" },
      { "name": "South Africa", "flag": "https://flagcdn.com/w160/za.png", "isoCode": "ZA" },
      { "name": "Sri Lanka", "flag": "https://flagcdn.com/w160/lk.png", "isoCode": "LK" },
      { "name": "West Indies", "flag": "https://flagcdn.com/w160/jm.png", "isoCode": "WI" }
    ]
    """
}
