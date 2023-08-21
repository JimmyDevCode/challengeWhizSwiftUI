//
//  ListDetailView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 19/08/23.
//

import SwiftUI

struct ListDetailView: View {
    
    @State var producto: ProductoRespuesta
    
    var body: some View {
        VStack{
            CardDetailView(producto: producto)
            .padding()
            Spacer()
        }
        
        .navigationTitle("Detalle")
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let imageNames = ["image-presentation", "image-presentation", "image-placeholder"]
        ListDetailView(producto: ProductoRespuesta(codigo: "1", nombre: "TV SAMSUNG 44 PULGADAS FULL HD", categoria: "Todos", codigoCategoria: "C", precioFinal: 23490.90, urlImagenes: imageNames))
    }
}
