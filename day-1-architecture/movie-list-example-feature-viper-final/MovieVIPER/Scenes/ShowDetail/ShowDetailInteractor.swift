//
//  ShowDetailInteractor.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
//

import Foundation

final class ShowDetailInteractor: ShowDetailInteractorProtocol {
    var delegate: (any ShowDetailInteractorDelegate)?
    
    let service: ShowDetailServiceProtocol!
    
    init(service: ShowDetailServiceProtocol!) {
        self.service = service
    }

    func loadData(showID: Int) {
        self.delegate?.handleOutput(.showLoading(true))
        service.fetchDetailedTVSeries(id: showID) { [weak self] result in
            guard let self else { return }
            self.delegate?.handleOutput(.showLoading(false))
            switch result {
            case .success(let tvShow):
                self.delegate?.handleOutput(.showTVShowDetail(tvShow))
            case .failure(let error):
                print(error)
            }
        }
    }
}
