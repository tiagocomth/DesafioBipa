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
    @Published var searchText: String = ""
    @Published var alertMessage: String = ""
    @Published var selectedNode: Node?
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func requestNodes() async {
        isLoading = true
        do {
            nodes = try await service.fetchNodes()

        } catch(let error) {
            showAlert = true
            alertMessage = error.localizedDescription
        }
        isLoading = false

    }
}
