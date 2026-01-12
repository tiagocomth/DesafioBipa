//
//  NodeCardView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct NodeCardView: View {
    
    var node: Node
    
    var body: some View {
        HStack{
            Image("cube")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 10){
                Text(node.alias)
                    .foregroundStyle(.black)
                    .font(.system(size: 14))
                HStack{
                    Text("btc: \(Int.satsToBitcoin(number: node.capacity))")
                        .font(.caption)
                        .foregroundStyle(.black.secondary)
                    Text("channel: \(node.channels)")
                        .font(.caption)
                        .foregroundStyle(.black.secondary)

                }
                Text(node.publicKey)
                    .font(.caption)
                    .foregroundColor(.pinkBipa)
                    .lineLimit(0)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.black)
        }

    }
}

//#Preview {
//    NodeCardView(node: <#Binding<Node>#>)
//}
