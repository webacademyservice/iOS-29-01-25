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
    
    enum PodcastImage  {
        case remoute (URL)
        case local (String)
    }
    
    struct PodcastRow {
        let title: String
        let image: PodcastImage
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
                let imageString = episodData.entity?.data?.coverArt?.sources?.first?.url,
                let url = URL(string: imageString){
                
                image = .remoute(url)
                
            } else {
                //                image = Double.random(in: 0..<1) > 0.5 ? .local("photo"):.local("photo1")
                image = .local("photo")
            }
            return PodcastRow(
                title: episodData.entity?.data?.name ?? "-",
                image: image
            )
        }
        ?? []
    }
    
    func queryChange() {
        Task {
            do {
                let result = try await service.fetchData()
                let rows = procesResult(dataObject: result)
                await MainActor.run {
                    podcastResult = result
                    self.rows = rows
                }
            }
        }
    }
}
