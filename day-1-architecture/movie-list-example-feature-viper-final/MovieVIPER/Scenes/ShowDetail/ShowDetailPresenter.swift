//
//  ShowDetailPresenter.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
//

import Foundation

final class ShowDetailPresenter: ShowDetailPresenterProtocol {
    private let tvSerie: TVSeries!
    
    private let interactor: ShowDetailInteractorProtocol!
    private unowned let view: ShowDetailViewProtocol!
    
    init(
        tvSerie: TVSeries!,
        interactor: ShowDetailInteractorProtocol!,
        view: ShowDetailViewProtocol!
    ) {
        self.tvSerie = tvSerie
        self.interactor = interactor
        self.view = view
        
        self.interactor.delegate = self
    }
    
    func loadData() {
        interactor.loadData(showID: tvSerie.id)
        view.handleOutput(.updateTitle(tvSerie.name))
    }
}

extension ShowDetailPresenter: ShowDetailInteractorDelegate {
    func handleOutput(_ output: ShowDetailInteractorOutput) {
        switch output {
        case .showLoading(let bool):
            view.handleOutput(.showLoading(bool))
        case .showTVShowDetail(let tvShow):
            view.handleOutput(.showTVShowDetail(tvShow))
        }
    }
}
