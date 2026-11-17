//
//  TeamDTO.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public struct TeamDTO: Decodable, Sendable {
    public let name: String
    public let flag: String?
    public let img: String?
    public let isoCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case img
        case isoCode
    }
    
    public func toDomain() -> Team {
        let urlString = flag ?? img ?? ""
        
        return Team(
            name: name,
            flagUrl: URL(
                string: urlString
            ),
            isoCode: isoCode ?? Self.inferredISOCode(for: name)
        )
    }
    
    private static func inferredISOCode(for teamName: String) -> String {
        switch teamName.lowercased() {
        case "afghanistan": return "AF"
        case "austrelia": return "AU"
        case "bangladesh": return "BD"
        case "england": return "GB-ENG"
        case "india": return "IN"
        case "new zealand": return "NZ"
        case "pakistand": return "PK"
        case "south africa": return "ZA"
        case "sri lanka": return "LK"
        case "west indies": return "WI"
        default:
            return ""
        }
    }
    
}
