//
//  ShowListInteractor.swift
//  MovieViper
//
//  Created by Mete Karakul on 27.09.2025.
//

import Foundation

final class ShowListInteractor: ShowListInteractorProtocol {
    weak var delegate: ShowListInteractorDelegate?
    var service: ShowListServiceProtocol!
    
    init(service: ShowListServiceProtocol!) {
        self.service = service
    }
    
    func loadData() {
        service.fetchPopularTvSeries { result in
            switch result {
            case .success(let tvSeries):
                self.delegate?.handleOutput(.showTvSeries(tvSeries))
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
