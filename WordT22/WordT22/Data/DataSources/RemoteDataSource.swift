//
//  RemoteDataSource.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public struct RemoteDataSource: Sendable {
    private let endPointURL: URL
    
    public init(endPointURL: URL = URL(string:"https://jsonkeeper.com/b/ZPFG")!) {
        self.endPointURL = endPointURL
    }
    
    public func fetchTeam() async throws -> [TeamDTO] {
        let (data, response) = try await URLSession.shared.data(from: endPointURL)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([TeamDTO].self, from: data)
    }
    
}
