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
            if viewModel.poster == "N/A" {
                Image("sem-poster")
                    .resizable()
                    .frame(width: 81.3, height: 120.0, alignment: .center)
            } else {
                AsyncImage(url: URL(string: viewModel.poster)) { image in
                    image.image?.resizable()
                }
                .frame(width: 81.3, height: 120.0, alignment: .center)
            }
            
            
            VStack(alignment: .leading) {
                Text("\(viewModel.title) (\(viewModel.year))")
                    .bold()
                Text("Diretor: \(viewModel.director)")
                
                Text("Gênero: \(viewModel.genre)")
                
                Text("País: \(viewModel.country)")
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: 120)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .padding(.vertical, 10)
            
            }.padding(.horizontal, 8)
        }.background(Color.black)
    }
}

#Preview {
    MovieView(viewModel: MovieViewModel(id: 0,
                                        actors: "Keanu Reaves",
                                       country: "USA",
                                       director: "Watchowskis",
                                       genre: "Drama",
                                       imdbId: "tt12345",
                                        poster: "N/A",
                                        title: "The Matrix",
                                        year: "1999"))
}
