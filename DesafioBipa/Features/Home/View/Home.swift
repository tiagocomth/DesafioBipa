//
//  Home.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HeaderBipa()
                SearchView()
                InfoCardView()
                
                List(Node.mockList) { node in
                    NodeCardView(node: node)
                }
                
            }
            .background(Color(uiColor: .secondarySystemBackground))
        }
    }
}

#Preview {
    HomeView()
}
