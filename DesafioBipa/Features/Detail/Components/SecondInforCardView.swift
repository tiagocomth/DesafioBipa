//
//  SecondInfoCardView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 11/01/26.
//

import SwiftUI

struct SecondInfoCardView: View {
    
    var node: Node
    
    
    
    var body: some View {
        VStack(alignment: .leading){

                HStack{
                    VStack(alignment: .leading){
                        Text("firstSeen")
                            .padding(.bottom, 2)

                        Text("\(Int.unixToDateTime(unix: node.firstSeen))")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                    .padding(.trailing, 90)
                    VStack(alignment: .leading){
                        Text("updatedAt ")
                            .padding(.bottom, 2)
                        Text("\(Int.unixToDateTime(unix: node.updatedAt))")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                }
                .padding()
                
            HStack(spacing: 50){
                    VStack(alignment: .leading){
                        Text("city")
                            .padding(.bottom, 2)

                        Text("\(node.city?.ptBR ?? node.city?.en ?? "N/A")")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                    .padding(.trailing, 80)
                    VStack(alignment: .leading){
                        Text("country")
                            .padding(.bottom, 2)
                        Text("\(node.country?.ptBR ?? node.country?.en ?? "N/A")")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                Spacer()
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    SecondInfoCardView(node: Node.mockList.first!)
}
