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
                    .font(.system(size: 14))
                HStack{
                    Text("\(node.capacity)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("Channel Count: \(node.channels)")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                }
                Text(node.publicKey)
                    .font(.caption)
                    .foregroundColor(.accentColor)
                    .lineLimit(0)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }

    }
}

//#Preview {
//    NodeCardView(node: <#Binding<Node>#>)
//}
