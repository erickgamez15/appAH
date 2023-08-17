//
//  ViewModel.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import Foundation
import SwiftUI

//Clase que manda a llamar a la API para las peticiones
final class ViewModel{
    
    
    struct desgloceData: Decodable{
        var idMo: String
        var fecha: String
        var tipooper: String
        var totalcajero: String
    }
    
    @State private var desgloce: desgloceData?
    
    // Desgloce de Efectivo, Tarjetas, etc.
    func opcion51Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = [
            [
                "key": "opcion",
                "value": "51",
                "type": "text"
            ],
            [
                "key": "fecha",
                "value": date,
                "type": "text"
            ]
        ] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        //var error: Error? = nil
        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
                body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String
                let fileData = (try? NSData(contentsOfFile: paramSrc, options: []) as Data)!
                let fileContent = String(data: fileData, encoding: .utf8)!
                body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            if let error = error {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    // Ventas Hidalgo
    func opcion5Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = [
            [
                "key": "opcion",
                "value": "5",
                "type": "text"
            ],
            [
                "key": "fechaconsult",
                "value": date,
                "type": "text"
            ]
        ] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        //var error: Error? = nil
        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
                body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String
                let fileData = (try? NSData(contentsOfFile: paramSrc, options: []) as Data)!
                let fileContent = String(data: fileData, encoding: .utf8)!
                body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    //Gastos
    func opcion35Api(date: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = [
            [
                "key": "opcion",
                "value": "35",
                "type": "text"
            ],
            [
                "key": "fechaconsult",
                "value": date,
                "type": "text"
            ]
        ] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        //var error: Error? = nil
        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
                body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String
                let fileData = (try? NSData(contentsOfFile: paramSrc, options: []) as Data)!
                let fileContent = String(data: fileData, encoding: .utf8)!
                body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php")!, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
}
