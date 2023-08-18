//
//  ViewModel.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import Foundation

// Estructura para manejar las solicitudes a la API
struct APIManager {
    
    // URL de la API
    static let baseURL = "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php"
    
    static func requestData(withParameters parameters: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        //Validando los parametro de consulta de la API (opcion=100&fecha=\(date))
        guard let postData = parameters.data(using: .utf8) else {
            completion(.failure(NSError(domain: "DataEncodingError", code: -1, userInfo: nil)))
            return
        }
        
        //Validacion de la URL
        guard let url = URL(string: baseURL) else {
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
    
    //Decodificando los datos JSON de la API
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
    
    //Decodificando los datos JSON de la API
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
    
    //Decodificando los datos JSON de la API
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
    
    //Decodificando los datos JSON de la API
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

// Clase ViewModel para las funciones de solicitud
final class ViewModel {
    
    static func requestDesgloceAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestDesgloceAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func requestVentasTotalesAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestVentasTotalesAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func requestGastosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestGastosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func requestTraspasosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestTraspasosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    // Desgloce de Efectivo, Tarjetas, etc.
    static func opcion51Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestDesgloceAPI(withOption: "51", parameterKey: "fecha", date: date, completion: completion)
    }
    
    // Ventas Totales Hidalgo
    static func opcion5Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestVentasTotalesAPI(withOption: "5", parameterKey: "fechaconsult", date: date, completion: completion)
    }
    
    // Gastos
    static func opcion35Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestGastosAPI(withOption: "35", parameterKey: "fechaconsult", date: date, completion: completion)
    }
    
    // Traspasos
    static func opcion46Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestTraspasosAPI(withOption: "46", parameterKey: "fecha", date: date, completion: completion)
    }
}
