//
//  Repository.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 21/08/23.
//

import Foundation

protocol RepositoryAPIProtocol {
    func fetchProductos(completion: @escaping (Result<Respuesta, Error>) -> Void)
}

class RepositoryAPI: RepositoryAPIProtocol{
    
    private let networkingManagerProvider: NetworkingManagerProvider
    init() {
        networkingManagerProvider = NetworkingManager()
    }
    
    func fetchProductos(completion: @escaping (Result<Respuesta, Error>) -> Void) {
        networkingManagerProvider.fetchProductos(completion: completion)
    }

}
