//
//  ToggleBtn.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 18/07/2025.
//

import SwiftUI

struct ToggleBtn:View {
    let text:String
    let imageName:String
    let gender: Int
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.imcBackgroundSelected
        }else{
            Color.imcBackgroundComponent
        }
        
        Button(action: {selectedGender = gender}){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text, color: .white)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(color)
        }
    }
}

//#Preview {
//   // ToggleBtn()
//}
