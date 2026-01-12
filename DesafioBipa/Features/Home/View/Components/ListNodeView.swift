//
//  ListNodeView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import SwiftUI

/// Displays a non-scrollable list of nodes and reports selection via a callback.
struct ListNodeView: View {
    
    var nodes: [Node]
    
    let onNodeSelection: (Node) -> Void
    
    var body: some View {
        List(nodes) { node in
            Button {
                onNodeSelection(node)
            } label: {
                // Row content showing primary node information.
                NodeCardView(node: node)
            }
        }
        .scrollDisabled(true)
        // Height sized to fit rows plus extra bottom spacing for layout breathing room.
        .frame(height: CGFloat((nodes.count * LayoutConstants.NodeList.rowHeight) + 200), alignment: .top)
        .background(Color(uiColor: .secondarySystemBackground))
    }
}

//#Preview {
//    ListNodeView(nodes: Binding.constant(Node.mockList) {node in})
//}
