//
//  ImageExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 12/07/2025.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("stoa").resizable().frame(width: 50, height: 50)
        Image("stoa").resizable().frame(width: 50, height: 90).scaledToFit()
        Image("stoa").resizable().frame(width: 50, height: 90).scaledToFill()
        Image(systemName: "figure.walk").resizable().frame(width: 50, height: 50)
    }
}

#Preview {
    ImageExample()
}
