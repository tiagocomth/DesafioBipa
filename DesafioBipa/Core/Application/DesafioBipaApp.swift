//
//  DesafioBipaApp.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

@main
struct DesafioBipaApp: App {
    var body: some Scene {
        WindowGroup {
            let network = NetworkClient()
            let service = HomeService(network: network)
            let viewModel = HomeViewModel(service: service)
            HomeView(viewModel: viewModel)
        }
    }
}
