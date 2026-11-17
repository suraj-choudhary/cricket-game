//
//  TeamRepository.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation


public struct TeamRepository: TeamRepositoryProtocol, Sendable {
    
    private let localDataSource: LocalTeamDataSource
    private let remoteDataSource: RemoteDataSource
    private let preferLocalBundle: Bool
    
    public init(
        localDataSource: LocalTeamDataSource = LocalTeamDataSource(),
        remoteDataSource: RemoteDataSource = RemoteDataSource(),
        preferLocalBundle: Bool = true
    ) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
        self.preferLocalBundle = preferLocalBundle
    }
    
    
    public func fetchTeams() async throws -> [Team] {
        
        if preferLocalBundle {
            let localDTOs = try await localDataSource.loadTeam()
            return localDTOs.map { $0.toDomain() }
        }
        do {
            let remoteDTO = try await remoteDataSource.fetchTeam()
            return remoteDTO.map { $0.toDomain() }
        } catch {
            let fallbackDTOs = try await localDataSource.loadTeam()
            return fallbackDTOs.map { $0.toDomain() }
        }
        
    }
    
    
}
