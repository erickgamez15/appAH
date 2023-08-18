//
//  ApiManagerDelicias.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 18/08/23.
//

import Foundation

class APIManagerDelicias{
    
    //URL de la API Delicias
    static let deliciasURL = "http://hidalgo.no-ip.info:5610/delicias/production/Panel002.php"
    
    static func requestDataDelicias(withParameters parameters: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        //Validando los parametro de consulta de la API (opcion=100&fecha=\(date))
        guard let postData = parameters.data(using: .utf8) else {
            completion(.failure(NSError(domain: "DataEncodingError", code: -1, userInfo: nil)))
            return
        }
        
        //Validacion de la URL
        guard let url = URL(string: deliciasURL) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        //Haciendo POST a la API
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "NoDataError", code: -1, userInfo: nil)))
            }
        }.resume()
    }
    
    static func requestDeliciasAPI(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=100&fecha=\(date)"
        
        APIManagerDelicias.requestDataDelicias(withParameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([DeliciasData].self, from: data)
                    DispatchQueue.main.async {
                        // Handle decoded data here
                        print(decodedData)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
