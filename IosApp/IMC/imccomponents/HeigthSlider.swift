//
//  HeigthSlider.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 19/07/2025.
//

import SwiftUI

struct HeigthSlider: View {
    let text:String
   @Binding var selecterHeight:Double
    
    var body: some View {

            VStack{
                TitleText(text: text)
                InformationText(text: "\(Int(selecterHeight)) cm", color: .white)
                Slider(value: $selecterHeight, in:100...220, step: 1).accentColor(.purple).padding(.horizontal,16)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.imcBackgroundComponent)
        }
    }

