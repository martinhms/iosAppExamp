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
    @State var age:Int = 10
    @State var weigth:Int = 14
    var ageRange:ClosedRange = 1...100
    var weigthRange:ClosedRange = 10...200
    
    var body: some View {
        VStack{
            HStack{
                ToggleBtn(text: "Hombre", imageName: "heart.fill", gender:0,selectedGender: $gender )
                ToggleBtn(text: "Mujer", imageName: "heart.fill", gender:1,selectedGender: $gender )
                
            }
            HeigthSlider(text: "Altura", selecterHeight:$height)
            HStack{
                CounterComponent(text: "Edad", value: $age, range: ageRange)
                CounterComponent(text: "Peso", value: $weigth, range: weigthRange)
            }
            IMCCalculatorBtn(userWight: Double(weigth), userHeight: height)
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

struct IMCCalculatorBtn:View {
    let userWight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination:IMCResult(userWight: userWight, userHeight: userHeight)){
                Text("Calcular").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.purple).frame(maxWidth: .infinity, maxHeight: 100).background(.imcBackgroundComponent)
            }
        }
    }
}



#Preview {
    IMCView()
}
//#Preview {
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 1, )
//    ToggleBtn(text: "Hombre", imageName: "heart.fill", gender: <#T##Int#>: 0,)
//}
