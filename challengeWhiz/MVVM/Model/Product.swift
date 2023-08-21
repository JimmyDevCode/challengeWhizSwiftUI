//
//  Product.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

// MARK: - Respuesta
struct Respuesta: Codable {
    let codigo: String
    let mensaje: String
    let folio: String
    let advertencia: String
    let resultado: Resultado
}
// MARK: - Respuesta
struct Resultado: Codable {

    let categoria: String
    let productos: [Producto]
}

// MARK: - Producto
struct Producto: Codable{
    let id: String
    let nombre: String
    let codigoCategoria: CodigoCategoria
    let urlImagenes: [String]
    let precioFinal: Double
}

// MARK: - Paginacion
struct Paginacion: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
}

// MARK: - Categoria
enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}
