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
        VStack{
            ScrollView{
                HeaderBipa()
                SearchView()
                InfoCardView()
                ListNodeView(nodes: $viewModel.nodes) { node in
                    viewModel.selectedNode = node
                }
            }
            .refreshable {
                //TODO: add loading
                await viewModel.requestNodes()
            }
            .scrollIndicators(.hidden)
            .background(Color(uiColor: .secondarySystemBackground))

        }
        .sheet(item: $viewModel.selectedNode){ node in
            NodeDetailView(node: node)
        }
        .task {
            //TODO: add loading
            await viewModel.requestNodes()
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("Ok") { }
        }
    }
}

//#Preview {
//    HomeView(viewModel: HomeViewModel)
//}
