//
//  ShowDetailViewModel.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 28.09.2025.
//

import Foundation

protocol ShowDetailViewModelProtocol: AnyObject {
    var delegate: ShowDetailViewModelDelegate? { get set }
    func loadData()
}

enum ShowDetailViewModelOutput {
    case showLoading(Bool)
    case displayShow(ShowPresentation)
}

protocol ShowDetailViewModelDelegate: AnyObject {
    func handleOutput(_ output: ShowDetailViewModelOutput)
}

final class ShowDetailViewModel: ShowDetailViewModelProtocol {
    var delegate: (any ShowDetailViewModelDelegate)?
    
    var tvShow: TVSeries
    
    private var service: ShowDetailServiceProtocol
    
    init(tvShow: TVSeries, service: ShowDetailServiceProtocol) {
        self.tvShow = tvShow
        self.service = service
    }
    
    func loadData() {
        delegate?.handleOutput(.showLoading(true))
        service.fetchDetailedTVSeries(id: tvShow.id) { [weak self] result in
            guard let self else { return }
            delegate?.handleOutput(.showLoading(false))
            switch result {
            case .success(let tvSerie):
                tvShow = tvSerie
                let showPresentation = ShowPresentation(with: tvSerie)
                delegate?.handleOutput(.displayShow(showPresentation))
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ShowPresentation {
    var id: Int
    var posterPath: String?
    var tagline: String?
    var name: String
    var originalName: String
    
    var releaseDateText: String?
    var languageText: String?
    var genresText: String?
    var statusText: String?
    var voteAverageText: String?
    var overviewText: String?
    
    init(with tvShow: TVSeries) {
        self.id = tvShow.id
        self.posterPath = tvShow.posterPath
        self.tagline = tvShow.tagline
        self.name = tvShow.name
        self.originalName = tvShow.originalName
        self.releaseDateText = "First Air Date: \(tvShow.firstAirDate ?? "N/A")"
        self.statusText = "Status: \(tvShow.status ?? "Unknown")"
        self.languageText = "Original Language: \(tvShow.originalLanguage.uppercased())"
        self.voteAverageText = "Rating: \(String(format: "%.1f", tvShow.voteAverage))"
        self.overviewText = tvShow.overview
        let genresText = (tvShow.genres ?? []).compactMap({ $0.name }).joined(separator: ", ")
        self.genresText = genresText.isEmpty ? "N/A" : genresText
    }
}
