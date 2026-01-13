//
//  DetailView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import SwiftUI

/// Presents detailed information about a selected Lightning node.
/// Shown as a sheet from the Home screen.
struct NodeDetailView: View {
    
    /// The node whose details are being displayed.
    let node: Node
    
    var body: some View {
        ZStack{
            // Secondary background to match the app’s overall styling.
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack{
                // Decorative top image for visual identity.
                Image("coloredCube")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 130)
                    .padding()
                
                // Primary details: alias, public key, channels, and capacity.
                PrimaryInfoCardView(node: node)
                
                // Secondary details: timestamps and location.
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
