//
//  SuperheroDetail.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 28/07/2025.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id: String
    @State var superheroDetail: ApiNetwork.SuperheroDetail? = nil
    @State var loading: Bool = true
    var body: some View {
        
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superheroDetail = superheroDetail{
                WebImage(url: URL(string: superheroDetail.image.url))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                Text(superheroDetail.name).bold().font(.title).foregroundColor(.white)
                ForEach(superheroDetail.biography.aliases, id: \.self){ alias in
                    Text(alias).bold().font(.title2).foregroundColor(.gray).italic()
                }
                SuperheroStats(stats:superheroDetail.powerstats)
                Spacer()
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(.imcBackground)
            .onAppear{
                Task{
                    do{
                        superheroDetail = try await ApiNetwork().getHeroById(id:id)
                    }catch{
                        superheroDetail = nil
                        print("Error geting detail")
                    }
                    loading = false
                }
                
            }
    
    }
}

struct SuperheroStats: View {
    let stats: ApiNetwork.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Intelligence"))
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Strength"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Combat"))
            }
        }.padding(16).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 350)
            .background(.white)
            .cornerRadius(16)
            .padding(20)
    }
}

#Preview {
    SuperheroDetail(id:"2")
}
