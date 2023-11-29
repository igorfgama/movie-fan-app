//
//  SearchUIState.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation

enum SearchUIState: Equatable {
  case none
  case loading
  case emptyList
  case fullList([MovieViewModel])
  case error(String)
}
