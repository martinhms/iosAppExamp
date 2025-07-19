//
//  ImcTextComponents.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 18/07/2025.
//

import SwiftUI

struct InformationText:View {
    let text: String
    let color: Color
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(color)
    }
}

struct TitleText:View {
    let text: String
    let color: Color = Color.gray
    var body: some View {
        Text(text).font(.title2).bold().foregroundColor(color)
    }
}

#Preview {
    VStack{
        TitleText(text:"Hombre")
        InformationText(text:"Hombre", color: .black)

    }
}
