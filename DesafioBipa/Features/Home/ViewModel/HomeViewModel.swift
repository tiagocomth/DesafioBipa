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

final class HomeViewModel: HomeViewModelProtocol, ObservableObject{
    
    @Published var nodes: [Node] = []
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var showDetail: Bool = false
    @Published var alertMessage: String = ""
    @Published var selectedNode: Node?
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func requestNodes() async {
        
        do {
            nodes = try await service.fetchNodes()

        } catch(let error) {
            showAlert = true
            alertMessage = error.localizedDescription
        }
    }
}
