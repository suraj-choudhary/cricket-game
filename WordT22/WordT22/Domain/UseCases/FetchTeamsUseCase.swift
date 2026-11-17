//
//  FetchTeamsUseCase.swift
//  WordT22
//
//  Created by suraj_kumar on 17/11/26.
//

import Foundation

public struct FetchTeamsUseCase: Sendable {
    
    private let repository: any TeamRepositoryProtocol
    
    
    public init(repository: any TeamRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() async throws -> [Team] {
        let teams = try await repository.fetchTeams()
        return teams.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
    }
}
