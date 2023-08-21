//
//  Networking.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

protocol NetworkingManagerProvider {
    func fetchProductos(completion: @escaping (Result<Respuesta, Error>) -> Void)

}

class NetworkingManager: NetworkingManagerProvider {

    private let API = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a8"
    
    func fetchProductos(completion: @escaping (Result<Respuesta, Error>) -> Void) {
        guard let url = makeURL() else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            self.handleDataTaskResult(data: data, response: response, error: error, completion: completion)
        }.resume()
    }

    private func makeURL() -> URL? {
        return URL(string: API )
    }

    private func handleDataTaskResult(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<Respuesta, Error>) -> Void) {
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidResponse))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIError.invalidStatusCode(httpResponse.statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.emptyResponse))
                return
            }

            self.decodeData(data, completion: completion)
        
    }

    private func decodeData(_ data: Data, completion: @escaping (Result<Respuesta, Error>) -> Void) {
        do {
            let decodedResponse = try JSONDecoder().decode(Respuesta.self, from: data)
            completion(.success(decodedResponse))
        } catch {
            print("Error decoding JSON: \(error)")
            completion(.failure(error))
        }
    }
}

