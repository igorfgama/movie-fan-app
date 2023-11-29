//
//  movie_fan_appApp.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 26/11/23.
//

import SwiftUI

@main
struct movie_fan_appApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(interactor: SearchInteractor()))
        }
    }
}
