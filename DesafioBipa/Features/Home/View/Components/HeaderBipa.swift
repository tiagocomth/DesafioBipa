//
//  HeaderBipa.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct HeaderBipa: View {
    var body: some View {
        HStack(spacing: 2){
            Text("$Bipa")
                .font(.system(size: 16, weight: .semibold))
            Image(systemName: "chevron.down")
            
            Spacer()
            
            Image("bipa_logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipped(antialiased: true)
                .clipShape(Circle())
        }
        .padding(.bottom, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HeaderBipa()
}
