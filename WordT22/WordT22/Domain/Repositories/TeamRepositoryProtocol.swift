//
//  TeamRepositoryProtocol.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public protocol TeamRepositoryProtocol: Sendable {
    func fetchTeams() async throws -> [Team]
}
