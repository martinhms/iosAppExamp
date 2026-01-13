//
//  ContentView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 09/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle().foregroundColor(.blue).frame(height: 100).border(.red,width: 10)
                Rectangle().foregroundColor(.orange).frame(height: 100).border(.red,width: 10)
                Rectangle().foregroundColor(.yellow).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).border(.red,width: 10)
            }
            
            Rectangle().foregroundColor(.orange).frame(height: 100)
            HStack{
                Circle().foregroundColor(.green).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(.vertical,5)
                Rectangle().foregroundColor(.black).frame(height: 250).padding(.vertical,5)
                Circle().foregroundColor(.purple).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(.vertical,5)

            }
            Rectangle().foregroundColor(.orange).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack{
                Rectangle().foregroundColor(.blue).frame(height: 100)
                Rectangle().foregroundColor(.orange).frame(height: 100)
                Rectangle().foregroundColor(.yellow).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
        }.background(.red)
    
    }
}
#Preview {
    ContentView()
}
