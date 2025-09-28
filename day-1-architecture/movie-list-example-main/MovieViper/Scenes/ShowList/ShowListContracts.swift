//
//  ShowListContracts.swift
//  MovieViper
//
//  Created by Mete Karakul on 27.09.2025.
//

import Foundation

// MARK: - Router

enum ShowListRoute {
    case showDetails(TVSeries)
}

protocol ShowListRouterProtocol: AnyObject {
    func navigate(to route: ShowListRoute)
}

// MARK: - Presenter

// ViewController -> Presenter
protocol ShowListPresenterProtocol: AnyObject {
    func loadData()
}

enum ShowListPresenterOutput {
    case showLoading(Bool)
    case showTvSeries([ShowListCellPresentation])
}

// MARK: - View

// Presenter -> ViewController
protocol ShowListViewProtocol: AnyObject {
    func handleOutput(_ output: ShowListPresenterOutput)
}

// MARK: - Interactor

// Presenter -> Interactor
protocol ShowListInteractorProtocol: AnyObject {
    var delegate: ShowListInteractorDelegate? { get set }
    func loadData()
}

enum ShowListInteractorOutput {
    case showTvSeries([TVSeries])
}

protocol ShowListInteractorDelegate: AnyObject {
    func handleOutput(_ output: ShowListInteractorOutput)
}
