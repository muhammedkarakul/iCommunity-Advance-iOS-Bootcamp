//
//  MovieListPresenter.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 25.09.2025.
//

import Foundation

final class ShowListPresenter: ShowListPresenterProtocol, ShowListInteractorDelegate {
    
    private let interactor: ShowListInteractorProtocol!
    private let router: ShowListRouterProtocol!
    private unowned let view: ShowListViewProtocol!
    
    private var tvShows: [TVSeries] = []
    
    init(interactor: ShowListInteractorProtocol, router: ShowListRouterProtocol, view: ShowListViewProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.interactor.delegate = self
    }
    
    func loadData() {
        interactor.loadData()
    }
    
    func selectTVSeries(_ index: Int) {
        let tvShow = tvShows[index]
        router.navigate(to: .showDetails(tvShow))
    }
    
    func handleOutput(_ output: ShowListInteractorOutput) {
        switch output {
        case .showTVSeries(let tvSeries):
            self.tvShows = tvSeries
            let cellPresentations = tvSeries.map({ ShowListCellPresentation(posterPath: $0.posterPath) })
            view.handleOutput(.showTVSeries(cellPresentations))
        case .showLoading(let isLoading):
            view.handleOutput(.showLoading(isLoading))
        }
    }
}
