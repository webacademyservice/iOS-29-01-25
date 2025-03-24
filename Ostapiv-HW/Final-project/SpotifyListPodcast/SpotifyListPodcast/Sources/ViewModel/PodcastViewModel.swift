//
//  PodcastViewModel.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 05.03.2025.
//

import Foundation

class PodcastViewModel: ObservableObject {
    
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
        
    }
    
    
    let service:PodcastServiceProtocol
    @Published var podcastResult: PodcastResponse? {
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
                //                image = Double.random(in: 0..<1) > 0.5 ? .local("photo"):.local("photo1")
                image = .local("photo")
            }
            
            let durationMilliseconds = episodData.entity?.data?.duration?.totalMilliseconds ?? 0
            let durationMinutes = durationMilliseconds / 60000
            
            return PodcastRow(
                title: episodData.entity?.data?.name ?? "-",
                image: image,
                description: episodData.entity?.data?.description ?? "-",
                duration: durationMinutes
            )
        }
        ?? []
    }
    
    func queryChange() {
        Task {
            do {
                let result = try await service.fetchData()
                let newRows = procesResult(dataObject: result)
                await MainActor.run {
                    self.rows = newRows
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
}
