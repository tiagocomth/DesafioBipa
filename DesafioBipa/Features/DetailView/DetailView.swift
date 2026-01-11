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
        Text(node.alias)
    }
}

#Preview {
    NodeDetailView(node: Node.mockList.first!)
}
