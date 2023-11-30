//
//  SearchViewModel.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var search: String = ""
    
    private var cancellable: AnyCancellable?
    private var cancellableRequest: AnyCancellable?
    
    private let publisher = PassthroughSubject<Bool, Never>()
    private let interactor: SearchInteractor
    
    @Published var uiState: SearchUIState = .none
    
    init(interactor: SearchInteractor) {
      self.interactor = interactor
    }
    
    deinit {
      cancellable?.cancel()
      cancellableRequest?.cancel()
    }
    
    func listMovies() {
      self.uiState = .loading
      
      cancellableRequest = interactor.listMovie(text: search)
        .receive(on: DispatchQueue.main)
        .sink { completion in
          switch(completion) {
            case .failure(let appError):
              self.uiState = SearchUIState.error(appError.message)
              break
            case .finished:
              break
          }
          
        } receiveValue: { success in
            self.uiState = .loading
                
            var rows: [MovieViewModel] = []
            var id: Int = 0
                
            success.forEach { response in
                id = id + 1
                rows.append(MovieViewModel(id: id,
                                           actors: response.actors,
                                           country: response.country,
                                           director: response.director,
                                           genre: response.genre,
                                           imdbId: response.imdbId,
                                           poster: response.poster,
                                           title: response.title,
                                           year: response.year))
            }
              
            self.uiState = .fullList(rows)
        }
      }
}
