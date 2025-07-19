//
//  TextFields.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 17/07/2025.
//

import SwiftUI

struct TextFieldsExample: View {
    @State var email = ""
    var body: some View {
        TextField("Escribe tu email", text: $email)
            .keyboardType(.emailAddress)
            .padding(16)
            .background(.red.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal,32)
            .onChange(of: email){oldValue, newValue in
            print("El antiguo valor era \(oldValue) y el nuevo valor es \(newValue)")
                  }
    }
}

#Preview {
    TextFieldsExample()
}
