//
//  MovieListRouter.swift
//  MovieVIPER
//
//  Created by Seyfeddin Bassarac on 25.09.2025.
//

import UIKit

final class ShowListRouter: ShowListRouterProtocol {
    
    unowned private let view: UIViewController!
    
    init(view: UIViewController!) {
        self.view = view
    }
    
    func navigate(to route: ShowListRoute) {
        switch route {
        case .showDetails(let tvSeries):
            let vc = ShowDetailBuilder.make(tvSerie: tvSeries)
            self.view.show(vc, sender: nil)
        }
    }
}
