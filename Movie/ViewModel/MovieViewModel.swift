//
//  MovieViewModel.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation
import SwiftUI

struct MovieViewModel: Identifiable, Equatable {
    var id: Int = 0
    var actors: String = ""
    var country: String = ""
    var director: String = ""
    var genre: String = ""
    var imdbId: String = ""
    var poster: String = ""
    var title: String = ""
    var year: String = ""
    
    static func == (lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
