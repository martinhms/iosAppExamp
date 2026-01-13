//
//  IMCResult.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 19/07/2025.
//

import SwiftUI

struct IMCResult: View {
    let userWight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            InformationText(text: "Resultado", color: Color.white)
            let result = calculateImc(weight: userWight, height: userHeight)
            InformationText(text: "\(result)", color: Color.green)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(.imcBackground)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC Resultado").bold().foregroundColor(.white)
                }
            }
    }
}

func calculateImc(weight: Double, height:Double)-> Double{
    let result = weight/((height/100))*((height/100))
    return result
}

#Preview {
    IMCResult(userWight: 100.0, userHeight: 180.0)
}
