//
//  DetailView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import SwiftUI

struct NodeDetailView: View {
    
    let node: Node
    
    var body: some View {
        ZStack{
            
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image("coloredCube")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 130)
                    .padding()
                
                PrimaryInfoCardView(node: node)
                
                SecondInfoCardView(node: node)
                    
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.init(uiColor: .systemBackground))
                )
                .padding()
    
            }
        }
        .presentationDragIndicator(.visible)

    }
}

#Preview {
    NodeDetailView(node: Node.mockList.first!)
}
