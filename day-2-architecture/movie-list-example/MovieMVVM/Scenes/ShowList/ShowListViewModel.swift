//
//  ShowListViewModel.swift
//  MovieMVVM
//
//  Created by Mete Karakul on 28.09.2025.
//

import Foundation

protocol ShowListViewModelProtocol: AnyObject {

}

protocol ShowListServiceProtocol: AnyObject {
    
}

final class ShowListViewModel: ShowListViewModelProtocol {
    
    private let service: ShowListServiceProtocol
}
