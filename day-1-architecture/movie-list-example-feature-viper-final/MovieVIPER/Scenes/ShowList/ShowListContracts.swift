//
//  ShowListContracts.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 25.09.2025.
//

import Foundation

// MARK: Router

enum ShowListRoute {
    case showDetails(TVSeries)
}

protocol ShowListRouterProtocol: AnyObject {
    func navigate(to route: ShowListRoute)
}

// MARK: Presenter

// View Controller -> Presenter
protocol ShowListPresenterProtocol: AnyObject {
    func loadData()
    func selectTVSeries(_ index: Int)
}

// Presenter -> View Controller
enum ShowListPresenterOutput {
    case showLoading(Bool)
    case showTVSeries([ShowListCellPresentation])
}

// MARK: View

protocol ShowListViewProtocol: AnyObject {
    func handleOutput(_ output: ShowListPresenterOutput)
}

// MARK: Interactor

// Presenter -> Interactor
protocol ShowListInteractorProtocol: AnyObject {
    var delegate: ShowListInteractorDelegate? { get set }
    func loadData()
}

// Interactor -> Presenter
enum ShowListInteractorOutput {
    case showLoading(Bool)
    case showTVSeries([TVSeries])
}

protocol ShowListInteractorDelegate: AnyObject {
    func handleOutput(_ output: ShowListInteractorOutput)
}

