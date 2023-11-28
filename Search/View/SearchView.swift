//
//  SearchView.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 27/11/23.
//

import SwiftUI

struct SearchView: View {
    @State var text: String
    
    var body: some View {
        ZStack {
            VStack {
                Image("movie-fan-fundo")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    TextField("Buscar por filme", text: $text)
                        .foregroundColor(.white)
                      .textFieldStyle(CustomTextFieldStyle())
                    
                    Button(action: {
                        Text("Clicado")
                    }, label: {
                         Text("Buscar")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 16)
                            .overlay(
                              RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                }.padding()
                
                Spacer()
                
            }
        }.background(Color.black)
    }
}

#Preview {
    SearchView(text: "")
}
