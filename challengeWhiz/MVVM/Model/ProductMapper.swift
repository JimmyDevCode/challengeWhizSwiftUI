//
//  ProductMapper.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

struct ProductoRespuesta {
    
    let codigo: String
    let nombre: String
    let categoria: String
    let codigoCategoria: String
    let precioFinal: Double
    let urlImagenes: [String]
    
    static func mapToProductoRespuesta(response: Respuesta) -> [ProductoRespuesta] {
        return response.resultado.productos.map { productoResponse in
            ProductoRespuesta(
                codigo: productoResponse.id,
                nombre: productoResponse.nombre,
                categoria: response.resultado.categoria,
                codigoCategoria: productoResponse.codigoCategoria.rawValue,
                precioFinal: productoResponse.precioFinal,
                urlImagenes: productoResponse.urlImagenes
            )
        }
    }
    
    var formattedPrecioFinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        
        return formatter.string(from: NSNumber(value: precioFinal)) ?? ""
    }
}
