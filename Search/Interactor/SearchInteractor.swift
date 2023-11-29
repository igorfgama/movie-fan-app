//
//  SearchInteractor.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation
import Combine

class SearchInteractor {
  private let remote: SearchRemoteDataSource = .shared
}

extension SearchInteractor {
  func listMovie(text: String) -> Future<[SearchResponse], AppError> {
    return remote.listMovie(text: text)
  }
}
