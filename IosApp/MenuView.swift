//
//  MenuView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 18/07/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: IMCView()){
                    Text("IMC calculator")
                }
                NavigationLink(destination:ImageExample()){
                    Text("ImageExample")
                }
                NavigationLink{
                } label: {
                    Text("IMC Calculator")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
