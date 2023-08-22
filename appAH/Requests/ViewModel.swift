//
//  ViewModel.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import Foundation

// Clase ViewModel para las funciones de solicitud
final class ViewModel: ObservableObject {
    
    @Published var desgloce: [Desgloce]?
    @Published var totales: [TotalVentasData]?
    @Published var gastos: [GastosData]?
    @Published var traspasos: [TraspasosData]?
    @Published var delicias: [DeliciasData]?
    
    func fetchDesgloceData(date: String){
        APIManager.requestDesgloceAPI(withOption: "51", parameterKey: "fecha", date: date){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([Desgloce].self, from: data)
                    DispatchQueue.main.async {
                        self?.desgloce = decodedData
                        //print(self?.desgloce ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    func fetchTotalesVentasData(date: String){
        APIManager.requestVentasTotalesAPI(withOption: "5", parameterKey: "fechaconsult", date: date){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([TotalVentasData].self, from: data)
                    DispatchQueue.main.async {
                        self?.totales = decodedData
                        //print(self?.totales ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    func fetchGastosData(date: String){
        APIManager.requestGastosAPI(withOption: "35", parameterKey: "fechaconsult", date: date){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([GastosData].self, from: data)
                    DispatchQueue.main.async {
                        self?.gastos = decodedData
                        //print(self?.gastos ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    func fetchTraspasosData(date: String){
        APIManager.requestTraspasosAPI(withOption: "46", parameterKey: "fecha", date: date){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([TraspasosData].self, from: data)
                    DispatchQueue.main.async {
                        self?.traspasos = decodedData
                        //print(self?.traspasos ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    // Función para hacer la solicitud a la API y cargar los datos en el model
    func fetchDeliciasData(date: String) {
        APIManagerDelicias.requestDeliciasAPI(date: date) { [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([DeliciasData].self, from: data)
                    DispatchQueue.main.async {
                        self?.delicias = decodedData
                        //print(self?.delicias ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    // Desgloce de Efectivo, Tarjetas, etc.
    /*static func requestDesgloceAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestDesgloceAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion51Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestDesgloceAPI(withOption: "51", parameterKey: "fecha", date: date, completion: completion)
    }*/
    
    // Ventas Totales Hidalgo
    /*static func requestVentasTotalesAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestVentasTotalesAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion5Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestVentasTotalesAPI(withOption: "5", parameterKey: "fechaconsult", date: date, completion: completion)
    }*/
    
    // Gastos
    /*static func requestGastosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestGastosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion35Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestGastosAPI(withOption: "35", parameterKey: "fechaconsult", date: date, completion: completion)
    }*/
    
    // Traspasos
    /*static func requestTraspasosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestTraspasosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion46Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestTraspasosAPI(withOption: "46", parameterKey: "fecha", date: date, completion: completion)
    }*/
}
