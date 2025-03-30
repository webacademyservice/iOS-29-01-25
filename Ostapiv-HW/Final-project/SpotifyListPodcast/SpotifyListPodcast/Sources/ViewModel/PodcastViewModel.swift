//
//  PodcastViewModel.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 05.03.2025.
//

import Foundation
import AVKit

class PodcastViewModel: ObservableObject {
    @Published var isPlayerPresented = false
    @Published var errorMessage: String?
    var player: AVPlayer?
    
    internal init(service: any PodcastServiceProtocol = PodcastService()) {
        self.service = service
        self.podcastResult = podcastResult
        self.rows = rows
    }
    
    enum PodcastImage: Hashable {
        case remoute (URL)
        case local (String)
    }
    
    
    
    struct PodcastRow: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let image: PodcastImage
        let description: String
        let duration: Int
        let releaseDate: String
        let audioPreview: String
        
    }
    
    let service:PodcastServiceProtocol
    
    @Published var podcastResult: PodcastResponse?
    {
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var rows:[PodcastRow] = []
    
    func procesResult(dataObject:PodcastResponse) -> [PodcastRow] {
        
        dataObject.data?.podcastUnionV2?.episodesV2?.items?.map { episodData in
            let image:PodcastImage
            if
                let imageString = episodData.entity?.data?.coverArt?.sources?.last?.url,
                let url = URL(string: imageString){
                
                image = .remoute(url)
                
            } else {
                
                image = .local("photo")
            }
            // Перетворення тривалість в хв
            let durationMilliseconds = episodData.entity?.data?.duration?.totalMilliseconds ?? 0
            let durationMinutes = durationMilliseconds / 60000
            
            // Перетворення дати
            let releaseDateIosString = episodData.entity?.data?.releaseDate?.isoString ?? "-"
            let formattedDate = ISO8601DateFormatter()
                .date(from: releaseDateIosString)
                .map { DateFormatter.localizedString(from: $0, dateStyle: .medium, timeStyle: .short) }
            ?? "Invalid date format"
            
            // audio
            let audioLink = episodData.entity?.data?.audioPreview?.url ?? "-"
            
            return PodcastRow(
                title: episodData.entity?.data?.name ?? "-",
                image: image,
                description: episodData.entity?.data?.description ?? "-",
                duration: durationMinutes,
                releaseDate: formattedDate,
                audioPreview: audioLink
                
            )
        }
        ?? []
    }
    
    // audio
    func playAudio(from urlString: String) {
        guard let url = URL(string: urlString), urlString != "-" else {
            print("Невірний URL для аудіо")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play()
        isPlayerPresented = true
    }
    
    func queryChange() {
        Task {
            do {
                let result = try await service.fetchData()
                //                     CacheManager.shared.updateCache(data: result)
                let newRows = procesResult(dataObject: result)
                await MainActor.run {
                    self.rows = newRows
                }
            } catch {
                print("Помилка завантаження: \(error.localizedDescription)")
            }
        }
    }
    
}
