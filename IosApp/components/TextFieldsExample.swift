//
//  TextFields.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 17/07/2025.
//

import SwiftUI

struct TextFieldsExample: View {
    @State var email = "hola"
    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.8))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: email){oldValue, newValue in
                print("El antiguo valor era \(oldValue) y el nuevo valor es \(newValue)")
            }
            SecureField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.8))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: email){oldValue, newValue in
                print("El antiguo valor era \(oldValue) y el nuevo valor es \(newValue)")
            }
        }
    }
}

#Preview {
    TextFieldsExample()
}
