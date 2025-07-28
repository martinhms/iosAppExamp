//
//  SuperheroSearcher.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 27/07/2025.
//

import SwiftUI

struct SuperheroSearcher: View {
    @State var superheroName:String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    var body: some View {
        VStack{
            TextField("", text: $superheroName, prompt: Text("Superman...").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple,width: 2)
                .padding(8)
                .autocorrectionDisabled() //desactiva el autocorrector del diccionadrio
                .onSubmit {
                    print(superheroName)
                    Task{ // TODO agregar nota
                        do{
                            wrapper = try await ApiNetwork().getHerosByQuery(query: superheroName)
                            print(wrapper)
                        }catch{
                            print("error")
                        }
                    }
                }
            List(wrapper?.results ?? []){ superhero in
                SuperheroItem(superhero: superhero)
            }.listStyle(.plain)
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.imcBackground)
    }
}

struct SuperheroItem: View {
    let superhero: ApiNetwork.Superhero
    var body: some View {
        ZStack{
            Rectangle()
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32).listRowBackground(Color.imcBackground)
    }
}

#Preview {
    SuperheroSearcher()
}

#Preview {
    SuperheroItem(superhero: ApiNetwork.Superhero(id: "1", name: "Iron Man"))
}
