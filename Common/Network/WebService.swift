//
//  WebService.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation

enum WebService {
  
  enum Endpoint: String {
    case base = "http://localhost:8080"
    case listMovies = "/movie/list/"
  }
  
  enum NetworkError {
    case badRequest
    case notFound
    case unauthorized
    case internalServerError
  }
  
  enum Method: String {
    case get
    case post
    case put
    case delete
  }
  
  enum Result {
    case success(Data)
    case failure(NetworkError, Data?)
  }
  
    private static func completeUrl(path: Endpoint, text: String?) -> URLRequest? {
    guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)\(text ?? "")") else { return nil }
    print(url)
    
    return URLRequest(url: url)
  }
  
  public static func call(path: Endpoint,
                           method: Method,
                           text: String?,
                           data: Data?,
                           completion: @escaping (Result) -> Void) {
    
      guard var urlRequest = completeUrl(path: path, text: text) else { return }
    
      /*
    _ = LocalDataSource.shared.getUserAuth()
      .sink { userAuth in
        if let userAuth = userAuth {
          urlRequest.setValue("\(userAuth.tokenType) \(userAuth.idToken)", forHTTPHeaderField: "Authorization")
        }
       */
        
        urlRequest.httpMethod = method.rawValue
        //urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if data != nil {
            urlRequest.httpBody = data
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
          // roda em background (Non-MainThread)
          guard let data = data, error == nil else {
            print(error)
            completion(.failure(.internalServerError, nil))
            return
          }
          
          if let r = response as? HTTPURLResponse {
            switch r.statusCode {
              case 400:
                completion(.failure(.badRequest, data))
                break
              case 401:
                completion(.failure(.unauthorized, data))
                break
              case 200:
                completion(.success(data))
              default:
                break
            }
          }
          
          print(String(data: data, encoding: .utf8))
          print("response\n")
          print(response)
          
        }
        task.resume()
      }
    
  }
  
/*
  public static func call<T: Encodable>(path: Endpoint,
                                        method: Method = .get,
                                        body: T,
                                        completion: @escaping (Result) -> Void) {
    guard let jsonData = try? JSONEncoder().encode(body) else { return }
    
    call(path: path, method: method, contentType: .json, data: jsonData, completion: completion)
  }
 
}
*/
