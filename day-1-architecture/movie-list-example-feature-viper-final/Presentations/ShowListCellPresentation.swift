//
//  ShowListCellPresentation.swift
//  MovieMVC
//
//  Created by Seyfeddin Bassarac on 26.09.2025.
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
