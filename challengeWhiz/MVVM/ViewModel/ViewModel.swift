//
//  ViewModel.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var productos = [ProductoRespuesta]()
    @Published var isFetching: Bool = false
    
    
    private let repositoryAPI: RepositoryAPIProtocol
    init(){
        self.repositoryAPI = RepositoryAPI()
            self.fetchProducts()
    }
    
    func fetchProducts() {
        isFetching = true
        repositoryAPI.fetchProductos {[weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                switch result {
                case .success(let respuesta):
                    self?.productos = ProductoRespuesta.mapToProductoRespuesta(response: respuesta)
                case .failure(let error):
                    print("Error al cargar productos: \(error)")
                }
            }
            
        }
    }
}
