//
//  Home.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

/// Root view for the Home screen. Displays header, search/sort controls,
/// a summary card, and a node list with filtering and detail presentation.
struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            ScrollView{
                HeaderBipa()
                SearchView(searchText: $viewModel.searchText, sortOption: $viewModel.sortOption)
                InfoCardView(listTitle: viewModel.listTitle)

                // List of nodes filtered by search text. Selecting a node presents details.
                ListNodeView(nodes: viewModel.filteredNodes) { node in
                    viewModel.selectedNode = node
                }
            }
            // Semi-transparent overlay shown while data is loading.
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                        
                        ProgressView()
                            .tint(Color.white)
                    }
                }
            }
            .refreshable {
                await viewModel.requestNodes()
            }
            .scrollIndicators(.hidden)
            .background(Color(uiColor: .secondarySystemBackground))
            .sheet(item: $viewModel.selectedNode){ node in
                NodeDetailView(node: node)
            }
            .task {
                await viewModel.requestNodes()
            }
            .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
                Button("Ok") { }
            }
        }
    }
}

//#Preview {
//    HomeView(viewModel: HomeViewModel)
//}
