//
//  PrimaryInfoCardView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 11/01/26.
//

import SwiftUI

struct PrimaryInfoCardView: View {
    
    var node: Node
    
    var body: some View {
        VStack{
            Text(node.alias)
                .font(.title3)
                .padding()
                .padding(.bottom, 0)
            
            VStack(alignment: .leading){

                VStack(alignment: .leading){
                    Text("public key")
                        .padding(.bottom, 2)
                    Text(node.publicKey)
                        .foregroundStyle(.secondary)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
                .padding(.horizontal)

                HStack{
                    VStack(alignment: .leading){
                        Text("channels")
                            .padding(.bottom, 2)

                        Text("\(node.channels)")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                    .padding(.trailing, 90)
                    VStack(alignment: .leading){
                        Text("sats")
                            .padding(.bottom, 2)
                        Text("\(node.capacity)")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12))
                    }
                }
                .padding()
                
            }

        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.init(uiColor: .systemBackground))
                
        )
        .padding()
    }
}

#Preview {
    PrimaryInfoCardView(node: Node.mockList.first!)
}
