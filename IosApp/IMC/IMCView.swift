//
//  IMCView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 18/07/2025.
//

import SwiftUI

struct IMCView: View {
    
    //    init(){
    //        UINavigationBar.appearance().titleTextAttributes =
    //        [.foregroundColor: UIColor.white]
    //    }
    @State var gender:Int = 0
    var body: some View {
        VStack{
            HStack{
                ToggleBtn(text: "Hombre", imageName: "heart.fill", gender:0,selectedGender: $gender )
                ToggleBtn(text: "Mujer", imageName: "heart.fill", gender:1,selectedGender: $gender )

            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(.imcBackground)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC Calculator").bold().foregroundColor(.white)
                }
            }
        //            .navigationBarBackButtonHidden()
        //            .navigationTitle("IMC Calculator")
    }
}

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
                InformationText(text: text)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(color)
        }
    }
}

struct InformationText:View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

#Preview {
    IMCView()
}
//#Preview {
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 1, )
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 0,)
//}
