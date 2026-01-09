//
//  ContentView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack(spacing: 2){
                Text("$Bipa")
                    .font(.system(size: 16, weight: .semibold))
                Image(systemName: "chevron.down")
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 30)
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
