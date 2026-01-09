//
//  SearchView.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 09/01/26.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        HStack{
            HStack(spacing: 0){
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(searchText.isEmpty ? Color.secondary : Color.primary)
                    .padding(.leading, 10)
                TextField("Search", text: $searchText)
                    .foregroundColor(.primary)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "xmark.circle.fill")
                            .padding(.trailing, 0)
                            .foregroundColor(.primary)
                            .opacity(searchText.isEmpty ? 0 : 1)
                            .onTapGesture {
                                self.searchText = ""
                            }
                    }
                    .padding(10)
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.init(uiColor: .systemGray5))
                    
            )
            Menu {
                Button("Top Capacity Nodes") {}
                Button("New Nodes") {}

            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .frame(width: 20, height: 15)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.primary)
            }
            .padding(.leading, 10)
            
        }
        .padding(.trailing, 8)
    }
}

#Preview {
    SearchView()
}




