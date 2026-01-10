//
//  Home.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                HeaderBipa()
                SearchView()
                InfoCardView()
                
                List(viewModel.nodes) { node in
                    NodeCardView(node: node)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
        }
        .task {
            await viewModel.requestNodes()
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("Ok") { }
        }
    }
}

//#Preview {
//    HomeView(viewModel: <#HomeViewModel#>)
//}
