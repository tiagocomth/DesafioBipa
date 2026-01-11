//
//  HomeViewModel.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    
    func requestNodes() async
    
}
@MainActor
final class HomeViewModel: HomeViewModelProtocol, ObservableObject{
    
    @Published var nodes: [Node] = []
    var filteredNodes: [Node] {
        if searchText.isEmpty {
            return nodes
        } else {
            return nodes.filter {
                $0.alias.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var showDetail: Bool = false
    @Published var listTitle: String = ""
    @Published var searchText: String = ""
    @Published var alertMessage: String = ""
    @Published var selectedNode: Node?
    @Published var sortOption: SortOption = .connectivity {
        didSet {
            Task {
                await self.requestNodes()
            }
            listTitle = sortOption.rawValue
        }
    }
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
        listTitle = sortOption.rawValue
    }
    
    func requestNodes() async {
        isLoading = true
        do {
            nodes = try await service.fetchNodes(sortOption)

        } catch(let error) {
            showAlert = true
            alertMessage = error.localizedDescription
        }
        isLoading = false

    }
}
