//
//  LabelExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 12/07/2025.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Hola mundo", systemImage: "figure.badminton")
        Label( title:{Text("Label")},
               icon: {Image("stoa").resizable().frame(width: 50,height: 50)}
        )

    }
}

#Preview {
    LabelExample()
}
