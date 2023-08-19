//
//  ApiManager.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 18/08/23.
//

import Foundation

// Estructura para manejar las solicitudes a la API
class APIManager {
    
    // URL de la API
    static let baseURL = "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php"
    
    static func requestData(withParameters parameters: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        //Validacion de la URL
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        //Validando los parametro de consulta de la API (opcion=\(option)&fecha=\(date))
        guard let postData = parameters.data(using: .utf8) else {
            completion(.failure(NSError(domain: "DataEncodingError", code: -1, userInfo: nil)))
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
    
    //Decodificando los datos JSON de la API para la opcion 51 Desgloce de Traspasos, Efectivo, etc.
    static func requestDesgloceAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=\(option)&\(parameterKey)=\(date)"
        
        APIManager.requestData(withParameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Desgloce].self, from: data)
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
    
    //Decodificando los datos JSON de la API para la opcion 5 Total de ventas de la AH
    static func requestVentasTotalesAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=\(option)&\(parameterKey)=\(date)"
        
        APIManager.requestData(withParameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([TotalVentasData].self, from: data)
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
    
    //Decodificando los datos JSON de la API de la opcion 35 Gastos
    static func requestGastosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=\(option)&\(parameterKey)=\(date)"
        
        APIManager.requestData(withParameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([GastosData].self, from: data)
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
    
    //Decodificando los datos JSON de la API para la opcion 46 Traspasos
    static func requestTraspasosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=\(option)&\(parameterKey)=\(date)"
        
        APIManager.requestData(withParameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([TraspasosData].self, from: data)
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
