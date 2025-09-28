//
//  MovieListInteractor.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 25.09.2025.
//

import Foundation

class ShowListInteractor: ShowListInteractorProtocol {
    weak var delegate: (any ShowListInteractorDelegate)?
    var service: ShowListServiceProtocol!
    
    init(service: ShowListServiceProtocol!) {
        self.service = service
    }
    
    func loadData() {
        if service.currentPage == 1 {
            self.delegate?.handleOutput(.showLoading(true))
        }
        service.fetchPopularTvSeries { [weak self] result in
            guard let self else { return }
            self.delegate?.handleOutput(.showLoading(false))
            switch result {
            case .success(let shows):
                self.delegate?.handleOutput(.showTVSeries(shows))
            case .failure(let error):
                print(error)
            }
        }
    }
}
