//
//  PodcastViewModel.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 04.03.2025.
//

import Foundation
// Сервіс для передачі списку підкастів (PodcastService)
class PodcastService: ObservableObject, PodcastServiceProtocol {
    
//  @Published var podcastResponse: PodcastResponse?
    
    struct PodcastServiceError: Error {
        let reason: String
    }
    
    func fetchData() async throws -> PodcastResponse {
        //Перетворити запит на запрос
        let requestPath = "https://spotify23.p.rapidapi.com/podcast_episodes/?id=0ofXAdFIQQRsCYj9754UFx&offset=0&limit=50"
        guard let url = URL(string: requestPath) else {
            throw PodcastServiceError(reason: "Не можу зробити URL від \(requestPath)")
        }
        // відправити запит в мережу
        var request = URLRequest(url: url)
        
        //хедери та ключі для доступу
        request.setValue("315774d55emsh81ccc97687857eep19a986jsne4d92bec7e03", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("spotify23.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let response = try await URLSession.shared.data(for: request) // дочекались відповіді
            
            let data = response.0
            
            let decodedResponse = try JSONDecoder().decode(PodcastResponse.self, from: data) // перетворили JSON дані на модель
            
            return decodedResponse // передача ддя виводу на екран

            
        }
    }

protocol PodcastServiceProtocol {
    
    func fetchData() async throws -> PodcastResponse
}
