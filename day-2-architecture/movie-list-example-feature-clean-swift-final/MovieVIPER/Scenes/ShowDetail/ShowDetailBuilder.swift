//
//  ShowDetailBuilder.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
//

import Foundation

final class ShowDetailBuilder {
    
    static func make(tvSerie: TVSeries) -> ShowDetailViewController {
        let viewController = ShowDetailViewController(tvShow: tvSerie)

        let interactor = ShowDetailInteractor(service: ShowDetailService())
        
        let presenter = ShowDetailPresenter(
            tvSerie: tvSerie,
            interactor: interactor,
            view: viewController
        )
        viewController.presenter = presenter
        
        return viewController
    }
}
