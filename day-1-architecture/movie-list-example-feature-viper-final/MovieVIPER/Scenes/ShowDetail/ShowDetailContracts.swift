//
//  ShowDetailContracts.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
//

import Foundation

// MARK: Interactor

// Presenter -> Interactor
protocol ShowDetailInteractorProtocol: AnyObject {
    var delegate: ShowDetailInteractorDelegate? { get set }
    func loadData(showID: Int)
}

// Interactor -> Presenter
enum ShowDetailInteractorOutput {
    case showLoading(Bool)
    case showTVShowDetail(TVSeries)
}

protocol ShowDetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: ShowDetailInteractorOutput)
}

// MARK: Presenter

// View -> Presenter
protocol ShowDetailPresenterProtocol: AnyObject {
    func loadData()
}

enum ShowDetailOutput {
    case showLoading(Bool)
    case showTVShowDetail(TVSeries)
    case updateTitle(String)
}

// MARK: View

// Presenter -> View Controller

protocol ShowDetailViewProtocol: AnyObject {
    func handleOutput(_ output: ShowDetailOutput)
}
