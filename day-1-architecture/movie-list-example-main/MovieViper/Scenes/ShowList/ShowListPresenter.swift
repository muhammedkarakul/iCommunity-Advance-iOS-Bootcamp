//
//  ShowListPresenter.swift
//  MovieViper
//
//  Created by Mete Karakul on 27.09.2025.
//

import Foundation

final class ShowListPresenter: ShowListPresenterProtocol, ShowListInteractorDelegate {
    
    private let interactor: ShowListInteractorProtocol!
    private unowned let view: ShowListViewProtocol!
    
    init(
        interactor: ShowListInteractorProtocol!,
        view: ShowListViewProtocol!
    ) {
        self.interactor = interactor
        self.view = view
        self.interactor.delegate = self
    }
    
    func loadData() {
        interactor.loadData()
    }
    
    func handleOutput(_ output: ShowListInteractorOutput) {
        switch output {
        case .showTvSeries(let tvSeries):
            view.handleOutput(.showTvSeries(tvSeries))
        }
    }
}
