//
//  Fecha.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//
import Foundation

//Funcion para formatear la fecha
final class Fecha {
    
    //recibe un tipo de dato fecha y lo convierte a String yyyy-MM-dd
    func formatDate(date: Date) -> String {
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "yyyy-MM-dd"
        return newDateFormatter.string(from: date)
    }
}
