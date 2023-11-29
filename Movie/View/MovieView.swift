//
//  MovieView.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import SwiftUI

struct MovieView: View {
    let viewModel: MovieViewModel
    
    var body: some View {
        ZStack {
           
        HStack {
            Image(viewModel.poster)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 90)
                .padding(.horizontal, 8)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("\(viewModel.title) (\(viewModel.year))")
                    .bold()
                Text("Diretor: \(viewModel.director)")
                
                Text("Gênero: \(viewModel.genre)")
                
                Text("País: \(viewModel.country)")
                Spacer()
            }.frame(maxWidth: 400)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
            
        }.padding(.horizontal, 8)
            
        }
    }
}

#Preview {
    MovieView(viewModel: MovieViewModel(id: 0,
                                        actors: "Keanu Reaves",
                                       country: "USA",
                                       director: "Watchowskis",
                                       genre: "Drama",
                                       imdbId: "tt12345",
                                        poster: "poster",
                                        title: "The Matrix",
                                        year: "1999"))
}
