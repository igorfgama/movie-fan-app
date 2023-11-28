//
//  EditTextField.swift
//  movie-fan-app
//
//  Created by Igor Franca Gama on 27/11/23.
//

import SwiftUI

struct EditTextView: View {
  
  @Binding var text: String
  
  var placeholder: String = ""
  var keyboard: UIKeyboardType = .default
  var error: String? = nil
  var failure: Bool? = nil
  var isSecure: Bool = false
  
  var body: some View {
    VStack {
      if isSecure {
        SecureField(placeholder, text: $text)
          .foregroundColor(Color("textColor"))
          .keyboardType(keyboard)
          .textFieldStyle(CustomTextFieldStyle())
      } else {
        TextField(placeholder, text: $text)
          .foregroundColor(Color("textColor"))
          .keyboardType(keyboard)
          .textFieldStyle(CustomTextFieldStyle())
      }
      
      if let error = error, failure == true, !text.isEmpty {
        Text(error).foregroundColor(.red)
      }
    }
    .padding(.bottom, 10)
    
  }
}

#Preview {
    EditTextView(text: .constant("Texto"),
                 placeholder: "E-mail",
                 error: "Campo inválido",
                 failure: "a@a.com".count < 3)
}
