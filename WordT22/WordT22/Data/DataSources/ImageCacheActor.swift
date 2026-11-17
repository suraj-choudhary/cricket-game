//
//  ImageCacheActor.swift
//  WordT22
//
//  Created by suraj_kumar on 16/11/26.
//

import Foundation

public actor ImageCacheActor {
    
    public static let shared = ImageCacheActor()
    private var cache: [URL: Data] = [:]
    
    private var inflightTask: [URL: Task<Data, Error>] = [:]
    
    private init() {}
    
    
    public func imageData(for url: URL) async throws -> Data {
        if let cache = cache[url] {
            return cache
        }
        if let existingTask = inflightTask[url] {
            return try await existingTask.value
        }
        let task = Task<Data, Error> {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let http = response as? HTTPURLResponse, (200...300).contains(http.statusCode), !data.isEmpty else {
                throw URLError(.cannotDecodeRawData)
            }
            return data
        }
        inflightTask[url] = task
        do {
            let data = try await task.value
            cache[url] = data
            inflightTask[url] = nil
            return data
        } catch {
            inflightTask[url] = nil
            throw error
        }
    }
}

