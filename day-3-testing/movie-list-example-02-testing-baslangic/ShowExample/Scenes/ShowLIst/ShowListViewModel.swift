//
//  ShowListViewModel.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 28.09.2025.
//

import Foundation

protocol ShowListViewModelProtocol: AnyObject {
    var delegate: ShowListViewModelDelegate? { get set }
    func loadData()
    func selectShow(at index: Int)
}

enum ShowListViewModelOutput {
    case displayShows([ShowListCellPresentation])
    case showLoading(Bool)
}

protocol ShowListViewModelDelegate: AnyObject {
    func handleOutput(_ output: ShowListViewModelOutput)
    func navigate(to route: ShowListRoute)
}

final class ShowListViewModel: ShowListViewModelProtocol {
    var delegate: (any ShowListViewModelDelegate)?

    private let service: ShowListServiceProtocol
    
    private var shows: [TVSeries] = []
    
    init(service: ShowListServiceProtocol) {
        self.service = service
    }

    func loadData() {
        delegate?.handleOutput(.showLoading(true))
        service.fetchPopularTvSeries { [weak self] result in
            guard let self else { return }
            delegate?.handleOutput(.showLoading(false))
            switch result {
            case .success(let tvSeries):
                self.shows = tvSeries
                let cellPresentations: [ShowListCellPresentation] = self.shows.map(
                    { ShowListCellPresentation(tvShow: $0)
                    })
                delegate?.handleOutput(.displayShows(cellPresentations))
            case .failure(let error):
                print(error)
            }
        }
    }

    func selectShow(at index: Int) {
        let show = shows[index]
        delegate?.navigate(
            to: .detail(
                ShowDetailViewModel(
                    tvShow: show,
                    service: ShowDetailService()
                )
            )
        )
    }
}

struct ShowListCellPresentation {
    var posterPath: String?
    var showBorder: Bool = true
    
    init(
        posterPath: String? = nil,
        showBorder: Bool = true
    ) {
        self.posterPath = posterPath
        self.showBorder = showBorder
    }
    
    init(tvShow: TVSeries) {
        self.posterPath = tvShow.posterPath
        self.showBorder = true
    }
}
