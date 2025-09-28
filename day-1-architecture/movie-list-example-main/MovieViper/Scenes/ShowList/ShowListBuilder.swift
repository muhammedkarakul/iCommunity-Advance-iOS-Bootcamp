//
//  ShowListBuilder.swift
//  MovieViper
//
//  Created by Mete Karakul on 27.09.2025.
//

import UIKit

final class ShowListBuilder {
    
    static func make() -> ShowListViewController {
        
        let viewController = ShowListViewController()
        let service = ShowListService()
        let interactor = ShowListInteractor(service: service)
        let presenter = ShowListPresenter(interactor: interactor, view: viewController)
        viewController.presenter = presenter
        
        return viewController
    }
}
