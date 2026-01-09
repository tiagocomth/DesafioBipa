//
//  InfoCardView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct InfoCardView: View {
    var body: some View {
        HStack(){
            Image("bitcoin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack{
                Text("Lighting Node")
                    .font(.system(size: 24, weight: .bold, design: .default))
                Text("Welcome to iOS Challenge!")
                    .font(.system(size: 12, weight: .light, design: .default))
            }
            Spacer()
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.init(uiColor: .systemBackground))
                
        )
        .padding(.horizontal, 17)
    }
}

#Preview {
    InfoCardView()
}
