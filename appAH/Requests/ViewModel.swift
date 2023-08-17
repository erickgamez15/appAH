//
//  ViewModel.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import Foundation

//Clase que manda a llamar a la API para las peticiones
final class ViewModel{
    
    // Desgloce de Efectivo, Tarjetas, etc.
    func opcion51Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=51&fecha=\(date)"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    // Ventas Hidalgo
    func opcion5Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=5&fechaconsult=\(date)"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    //Gastos
    func opcion35Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = "opcion=35&fechaconsult=\(date)"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}
