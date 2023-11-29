//
//  AppError.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 28/11/23.
//

import Foundation

enum AppError: Error {
  case response(message: String)
  
  public var message: String {
    switch self {
      case .response(let message):
        return message
    }
  }
}
