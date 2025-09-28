//
//  ShowListBuilder.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
//

import UIKit

final class ShowListBuilder {
    
    static func make() -> ShowListViewController {
        
        let viewController = ShowListViewController()
        let service = ShowListService()
        let interactor = ShowListInteractor(service: service)
        let router = ShowListRouter(view: viewController)
        let presenter = ShowListPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
        
        return viewController
    }
}
