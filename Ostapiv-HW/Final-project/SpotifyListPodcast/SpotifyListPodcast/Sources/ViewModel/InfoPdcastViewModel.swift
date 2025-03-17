//
//  InfoPdcastViewModel.swift
//  SpotifyListPodcast
//
//  Created by Denis Ostapiv on 16.03.2025.
//

import Foundation

class InfoPdcastViewModel: ObservableObject {
    
    internal init(service: any PodcastServiceProtocol = PodcastService()) {
        self.service = service
        self.podcastResult = podcastResult
        self.rows = rows
    }
    
    enum PodcastImage  {
        case remoute (URL)
        case local (String)
    }
    
    struct PodcastRow1 {
        let title: String
        let image: PodcastImage
        let description: String
        let duration: Int
        let data: Data
    }
    
    
    let service:PodcastServiceProtocol
    @Published var podcastResult: PodcastResponse? {
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var rows:[PodcastRow1] = []
    
    func procesResult(dataObject:PodcastResponse) -> [PodcastRow1] {
        
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
            
            let durationMilliseconds = episodData.entity?.data?.duration?.totalMilliseconds ?? 0
            let durationMinutes = durationMilliseconds / 60000
            
            return PodcastRow1(
                title: episodData.entity?.data?.name ?? "-",
                image: image,
                description: episodData.entity?.data?.description ?? "-",
                duration: durationMinutes,
                data: episodData.entity?.data?.data?.isoString ?? Data()
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

