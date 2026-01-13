//
//  ButtonExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 12/07/2025.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("Btn press")
        }
        Button(
            action:{print("Hola mundo")}, label: {
                Text("Hola Mundo")
                    .frame(width: 100,height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        )
    }
}

struct Coueter:View {
    @State var count = 0
    var body: some View {
        Button(
            action:{count += 1}, label: {
                Text("Contador: \(count) ")
                    .frame(width: 100,height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        )     }
}

#Preview {
    VStack {
        ButtonExample()
        Coueter()
    }
}
