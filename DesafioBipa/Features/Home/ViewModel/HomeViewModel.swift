//
//  HomeViewModel.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import Foundation
import Combine

/// Abstraction for the Home screen view model behavior.
protocol HomeViewModelProtocol {
    
    func requestNodes() async
    
}

@MainActor
/// View model that manages Home screen state: data loading, filtering, sorting, and UI flags.
final class HomeViewModel: HomeViewModelProtocol, ObservableObject{
    
    /// All nodes returned by the service.
    @Published var nodes: [Node] = []
    
    /// Nodes filtered by the current `searchText`. If empty, returns all `nodes`.
    var filteredNodes: [Node] {
        if searchText.isEmpty {
            return nodes
        } else {
            return nodes.filter {
                $0.alias.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    /// Indicates whether a network request is in progress.
    @Published var isLoading: Bool = false
    
    /// Controls the presentation of an error alert.
    @Published var showAlert: Bool = false
    
    /// Title displayed for the current list, derived from the selected sort option.
    @Published var listTitle: String = ""
    
    /// Current search text used to filter nodes by alias.
    @Published var searchText: String = ""
    
    /// Message displayed in the alert when an error occurs.
    @Published var alertMessage: String = ""
    
    /// The node currently selected for detail presentation.
    @Published var selectedNode: Node?
    
    /// Current sorting strategy. Updating it triggers a fresh fetch and updates the title.
    @Published var sortOption: SortOption = .connectivity {
        didSet {
            Task {
                await self.requestNodes()
            }
            listTitle = sortOption.rawValue
        }
    }
    
    /// Service used to load nodes. Injected for testability.
    let service: HomeServiceProtocol
    

    init(service: HomeServiceProtocol) {
        self.service = service
        listTitle = sortOption.rawValue
    }
    
    /// Loads nodes from the service using the current `sortOption`, updating loading and alert state.
    /// Errors are surfaced via `showAlert` and `alertMessage`.
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
