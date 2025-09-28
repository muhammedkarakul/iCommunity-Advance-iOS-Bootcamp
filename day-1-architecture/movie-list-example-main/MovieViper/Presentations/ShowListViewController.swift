//
//  ShowListViewController.swift
//  Movie
//
//  Created by Mete Karakul on 28.09.2025.
//

import Foundation

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
}
