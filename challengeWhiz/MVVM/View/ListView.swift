//
//  ListView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 19/08/23.
//

import SwiftUI
struct ListView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            if viewModel.isFetching {
                ProgressView()
            } else {
                List(viewModel.productos, id: \.codigo) { product in
                    NavigationLink(destination: ListDetailView(producto: product)) {
                       CardListView(producto: product)
                            .frame(maxWidth: .infinity)
                    }
                   .listRowSeparator(.hidden)
                   .listRowBackground(
                   RoundedRectangle(cornerRadius: 10)
                       .fill(Color.white)
                       .padding(EdgeInsets(top: 10, leading: 10, bottom: 2, trailing: 10)
                       )
                           .shadow(color: Color.black.opacity(0.1), radius: 2, x: 3, y: 3)
                   )
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
            
            
        }
        
        .background(Color.clear)
        .navigationTitle("Inicio")
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
