//
//  ShowDetailBuilder.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 28.09.2025.
//

import Foundation

class ShowDetailBuilder {
    static func make(viewModel: ShowDetailViewModelProtocol) -> ShowDetailViewController {
        let viewController = ShowDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
