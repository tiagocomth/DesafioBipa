//
//  ListNodeView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import SwiftUI

struct ListNodeView: View {
    
    @Binding var nodes: [Node]
    let onNodeSelection: (Node) -> Void
    
    var body: some View {
        List(nodes) { node in
            Button {
                onNodeSelection(node)
            } label: {
                NodeCardView(node: node)

            }
        }
        .scrollDisabled(true)
        .frame(height: CGFloat((nodes.count * LayoutConstants.NodeList.rowHeight)), alignment: .top)
    .background(Color(uiColor: .secondarySystemBackground))
    }
}

//#Preview {
//    ListNodeView(nodes: Binding.constant(Node.mockList) {node in})
//}
