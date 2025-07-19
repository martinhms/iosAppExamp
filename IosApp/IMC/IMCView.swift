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
    @State var height:Double = 150
    var body: some View {
        VStack{
            HStack{
                ToggleBtn(text: "Hombre", imageName: "heart.fill", gender:0,selectedGender: $gender )
                ToggleBtn(text: "Mujer", imageName: "heart.fill", gender:1,selectedGender: $gender )

            }
            HeigthSlider(text: "Altura", selecterHeight:$height)
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



#Preview {
    IMCView()
}
//#Preview {
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 1, )
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 0,)
//}
