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
    @Published var tabla: [TablaData]?
    @Published var pagosOtrasFechas: [PagosOtrasFechas]?
    @Published var delicias: [DeliciasData]?
    
    //Hace el llamdado de cada metodo
    func fetchData(date: String) {
        fetchDesgloceData(date: date)
        fetchTotalesVentasData(date: date)
        fetchGastosData(date: date)
        fetchTraspasosData(date: date)
        fetchPagosOtrasFechasData(date: date)
        fetchDeliciasData(date: date)
    }
    
    //Decodificando //Verificando los datos JSON de la API de la opcion 51 Desgloce de Traspasos, Efectivo, tec.
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
    
    //Decodificando los datos JSON de la API de la opcion 5 Total Ventas Abarrotera Hidalgo
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
    
    //Decodificando los datos JSON de la API de la opcion 35 Gastos
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
    
    //Decodificando los datos JSON de la API de la opcion 46 Traspasos
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
    
    //Decodificando los datos JSON de la API de la opcion 50 Tabla
    func fetchTablaData(docid: String){
        APIManager.requestTablaAPI(withOption: "50", parameterKey: "docid", docid: docid){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([TablaData].self, from: data)
                    DispatchQueue.main.async {
                        self?.tabla = decodedData
                        //print(self?.traspasos ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    //Decodificando los datos JSON de la API de la opcion 77 PagosOtrasFechas
    func fetchPagosOtrasFechasData(date: String){
        APIManager.requestPagosOtrasFechasAPI(withOption: "77", parameterKey: "fecha", date: date){ [weak self] data, error in
            if let data = data {
                do {
                    //Decidifca los datos que vienen en formato JSON
                    let decodedData = try JSONDecoder().decode([PagosOtrasFechas].self, from: data)
                    DispatchQueue.main.async {
                        self?.pagosOtrasFechas = decodedData
                        //print(self?.pagosOtrasFechas ?? "null")
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    //Decodificando los datos JSON de la API de la opcion 100 Total Ventas Delicias
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
}
