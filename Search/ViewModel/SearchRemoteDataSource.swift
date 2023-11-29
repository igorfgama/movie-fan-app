//
//  SearchRemoteDataSource.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation
import Combine

class SearchRemoteDataSource {
  
  // padrao singleton
  // Temos apenas 1 unico objeto vivo dentro da aplicação
  
  static var shared: SearchRemoteDataSource = SearchRemoteDataSource()
  
  private init() {
  }
  
  func listMovie(text: String) -> Future<[SearchResponse], AppError> {
    return Future<[SearchResponse], AppError> { promise in
        WebService.call(path: .listMovies, method: .get, text: text, data: nil) { result in
        switch result {
          case .failure(let error, let data):
            if let data = data {
              if error == .unauthorized {
                //let decoder = JSONDecoder()
                //let response = try? decoder.decode(SignInErrorResponse.self, from: data)
                // completion(nil, response)
                
                  promise(.failure(AppError.response(message: "Erro desconhecido no servidor")))
              }
            }
            break
          case .success(let data):
            let decoder = JSONDecoder()
            let response = try? decoder.decode([SearchResponse].self, from: data)
            // completion(response, nil)
            
            guard let response = response else {
              print("Log: Error parser \(String(data: data, encoding: .utf8)!)")
              return
            }
            
            promise(.success(response))
            
            break
        }
      }
    }
    
  }
  
}
