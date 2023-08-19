//
//  ViewModel.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import Foundation

// Clase ViewModel para las funciones de solicitud
final class ViewModel {
    
    // Desgloce de Efectivo, Tarjetas, etc.
    static func requestDesgloceAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestDesgloceAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion51Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestDesgloceAPI(withOption: "51", parameterKey: "fecha", date: date, completion: completion)
    }
    
    // Ventas Totales Hidalgo
    static func requestVentasTotalesAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestVentasTotalesAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion5Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestVentasTotalesAPI(withOption: "5", parameterKey: "fechaconsult", date: date, completion: completion)
    }
    
    // Gastos
    static func requestGastosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestGastosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion35Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestGastosAPI(withOption: "35", parameterKey: "fechaconsult", date: date, completion: completion)
    }
    
    // Traspasos
    static func requestTraspasosAPI(withOption option: String, parameterKey: String, date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManager.requestTraspasosAPI(withOption: option, parameterKey: parameterKey, date: date, completion: completion)
    }
    
    static func opcion46Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestTraspasosAPI(withOption: "46", parameterKey: "fecha", date: date, completion: completion)
    }
    
    // Ventas Delicias
    static func requestDeliciasAPI(date: String, completion: @escaping (Data?, Error?) -> Void) {
        APIManagerDelicias.requestDeliciasAPI(date: date, completion: completion)
    }
    
    static func opcion100Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        requestDeliciasAPI(date: date, completion: completion)
    }
}
