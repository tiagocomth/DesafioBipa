//
//  DesafioBipaApp.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

@main
struct DesafioBipaApp: App {
    
    private let network = NetworkClient()
    private let service: HomeService
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
