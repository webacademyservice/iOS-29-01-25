//
//  CacheManager.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 25.03.2025.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    
    private let cacheKey = "cachedPodcasts"

    private init() {}
    
    /// Завантаження кешованих даних
    
    func loadCachedData() throws -> PodcastResponse? {
        guard let cachedData = UserDefaults.standard.data(forKey: cacheKey) else { return nil }
        return try JSONDecoder().decode(PodcastResponse.self, from: cachedData)
    }
    
    /// Збереження даних у кеш
    func saveToCache(data: PodcastResponse) {
        if let encodedData = try? JSONEncoder().encode(data){
            UserDefaults.standard.set(encodedData, forKey: cacheKey)
        }
    }
    
    func updateCache(data: PodcastResponse) {
           saveToCache(data: data)
           print("Кеш оновлено!")
       }
    
}
