//
//  Home.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HeaderBipa()
                SearchView()
                    .padding(.bottom, 20)
                InfoCardView()
                
                
                
                Spacer()
            }
            .padding(20)
            .background(Color(uiColor: .secondarySystemBackground))
        }
    }
}

#Preview {
    HomeView()
}
