//
//  CardListView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import SwiftUI

struct CardListView: View {
    var producto: ProductoRespuesta
    var body: some View {
        HStack {
            if !producto.urlImagenes.isEmpty{
                AsyncImageView(url: URL(string: producto.urlImagenes.first ?? ""), size: CGSize(width: 150, height: 150))
            }
            Spacer()
            VStack (alignment: .trailing) {
                Text(producto.nombre)
                    .padding()
                Text(String(producto.formattedPrecioFinal))
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}
   

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        let imageNames = ["image-presentation", "image-presentation", "image-placeholder"]
        CardListView(producto: ProductoRespuesta(codigo: "1", nombre: "TV SAMSUNG 44 PULGADAS FULL HD", categoria: "Todos", codigoCategoria: "C", precioFinal: 23490.90, urlImagenes: imageNames))
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
