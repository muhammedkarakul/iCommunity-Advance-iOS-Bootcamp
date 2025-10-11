//
//  ShowListBuilder.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 28.09.2025.
//

import Foundation

class ShowListBuilder {
    static func make() -> ShowListViewController {
        let viewController = ShowListViewController()
        let viewModel = ShowListViewModel(service: ShowListService())
        viewController.viewModel = viewModel
        
        return viewController
    }
}
