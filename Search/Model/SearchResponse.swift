//
//  SearchResponse.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation

struct SearchResponse: Decodable {
    var actors: String
    var country: String
    var director: String
    var genre: String
    var imdbId: String
    var poster: String
    var title: String
    var year: String
    
    enum CodingKeys: String, CodingKey {
        case actors
        case country
        case director
        case genre
        case imdbId
        case poster
        case title
        case year
    }
}
