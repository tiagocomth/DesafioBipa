//
//  DesafioBipaApp.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

/// The application’s entry point and root scene configuration.
@main
struct DesafioBipaApp: App {
    
    /// Low-level network client used across the app.
    private let network = NetworkClient()
    
    /// Service layer for Home-related operations, built on top of the network client.
    private let service: HomeService
    
    /// View model for the Home screen, injected with its service dependency.
    private let viewModel: HomeViewModel
    
    init() {
        self.service = HomeService(network: network)
        self.viewModel = HomeViewModel(service: service)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView(viewModel: viewModel)
            }
        }
    }
}
