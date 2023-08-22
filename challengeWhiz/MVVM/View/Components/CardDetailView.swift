//
//  CardDetailView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import SwiftUI

struct CardDetailView: View {
    
    var producto: ProductoRespuesta
    @State private var index = 0
    var body: some View {
        VStack{
            VStack{
                Text(producto.nombre)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            HStack{
                Text("CAT: \(producto.categoria.uppercased())")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.top, 5)
                Spacer()
            }
            TabView(selection: $index) {
                ForEach(Array(producto.urlImagenes.enumerated()), id: \.element) { (index, imageName) in
                    AsyncImageView(url: URL(string: imageName))
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding()
            if producto.urlImagenes.count > 1{
                HStack(spacing: 2) {
                    ForEach(0..<producto.urlImagenes.count, id: \.self) { circleIndex in
                        Circle()
                            .fill(circleIndex == self.index ? Color.primaryColor : Color.gray.opacity(0.5))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            VStack{
                Text(producto.formattedPrecioFinal)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .frame(height: 550 )
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let imageNames = ["image-presentation", "image-presentation", "image-placeholder"]
        CardDetailView(producto: ProductoRespuesta(codigo: "1", nombre: "TV SAMSUNG 44 PULGADAS FULL HD", categoria: "Todos", codigoCategoria: "C", precioFinal: 23490.90, urlImagenes: imageNames)).previewLayout(.fixed(width: 500, height: 500))
    }
}
