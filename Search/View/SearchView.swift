//
//  SearchView.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 27/11/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Image("movie-fan-fundo")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    TextField("Buscar por filme", text: $viewModel.search)
                        .foregroundColor(.white)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    Button(action: {
                        viewModel.listMovies()
                    }, label: {
                         Text("Buscar")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 16)
                            .overlay(
                              RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    }).disabled(viewModel.search.count < 2)
                }.padding()
                
                Spacer()
                
                ScrollView(showsIndicators: true) {
                    VStack {
                        if case SearchUIState.fullList(let rows) = viewModel.uiState {
                            LazyVStack {
                              ForEach(rows, content: MovieView.init(viewModel:))
                            }.padding(.horizontal, 10)
                        }
                    }
                }.background(Color.black)
            }
            
        }.background(Color.black)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel(interactor: SearchInteractor()))
}
