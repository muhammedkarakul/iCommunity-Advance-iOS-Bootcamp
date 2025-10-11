//
//  ShowDetailCoordinator.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 28.09.2025.
//

import UIKit

protocol ShowDetailCoordinatorFinishDelegate: AnyObject {
    func showDetailDidFinish()
}

final class ShowDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    weak var mainViewController: ShowDetailViewController?
    
    weak var finishDelegate: ShowDetailCoordinatorFinishDelegate?
    
    var viewModel: ShowDetailViewModelProtocol
    
    init(
        navigationController: UINavigationController,
        viewModel: ShowDetailViewModelProtocol
    ) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let viewController = ShowDetailBuilder.make(viewModel: viewModel)
        viewController.coordinator = self
        self.mainViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didFinish() {
        finishDelegate?.showDetailDidFinish()
    }
}
