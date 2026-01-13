//
//  CounterComponent.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 19/07/2025.
//

import SwiftUI

struct CounterComponent: View {
    let text:String
    @Binding var value: Int
    let range: ClosedRange<Int>
    
    var body: some View {
        
        VStack{
            TitleText(text: text)
            InformationText(text: "\(Int(value))", color: .white)
            HStack{
                Button(action: {
                    if value > range.lowerBound {
                        value -= 1
                    }
                }) {
                    Image(systemName: "minus")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.purple)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    if value < range.upperBound {
                        value += 1
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.purple)
                        .clipShape(Circle())
                }
            }.padding(.horizontal, 16)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.imcBackgroundComponent)
    }
}

#Preview {
    HStack(spacing: 20) {
        CounterComponent(text: "Edad", value: .constant(18), range: 1...100)
        CounterComponent(text: "Peso", value: .constant(70), range: 30...200)
    }
    .padding()
    .background(Color.black)
}

