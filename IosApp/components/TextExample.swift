//
//  TextExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 09/07/2025.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Text(  "Custom").font(.system(size: 40,weight: .bold))
        Text("Custom").font(.system(size: 40,weight: .light))
       
        Text("Aris Aris Aris").frame(width: 50).lineLimit(2).lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        
        Text("Custommmmmmmmmmm").font(.system(size: 40,weight: .bold,design: .monospaced)).foregroundColor(.blue).background(.red)
    }
}

#Preview {
    TextExample()
}
