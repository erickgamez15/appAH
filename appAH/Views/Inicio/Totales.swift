//
//  Totales.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI
import Foundation

//Vista que muestra los totales
struct Totales: View {
    
    @StateObject private var viewModel = ViewModel()
    var fecha: String
    
    var body: some View {
        
        Group{
            Section(
                header: Text("Totales")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 20)
            ){
                //VStack acomoda los elementos de manera vertical en una vista, miestras que HStack de manera horizontal
                VStack{
                    HStack {
                        Text("Ventas: ")
                        Text("$\(totalVentasFunc(), specifier: "%.3f")")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.green)
                    
                    Divider() //Linea divisora
                    
                    HStack {
                        Text("Gastos: ")
                        Text("$\(gastosFunc(), specifier: "%.5f")")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.red)
                    
                    Divider()
                    
                    HStack {
                        Text("Total final: ")
                        Text("$\(totalFinal(), specifier: "%.3f")")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.cyan)
                }
                .bold()
                .font(.body)
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
            }//End Section
        }//End Group
    }//End body
    
    //Trae el valor de la venta diaria de Delicias
    func deliciasVentasFunc() -> Float {
        var totalVentaDelicia: Float = 0.0
        
        callMethodDelicias()
        
        for delicia in viewModel.delicias ?? [] {
            if let totalDelicia = Float(delicia.TOTALVENTA) {
                totalVentaDelicia += totalDelicia
            } else {
                print("No se pudo convertir '\(delicia.TOTALVENTA)' a Float.")
            }
        }
        
        return totalVentaDelicia
    }
    
    func totalVentasFunc() -> Float{
        var totalVentas: Float = 0.0
        var total: Float = 0.0
        
        callNethodTotalVentas()
        
        for importe in viewModel.totales ?? [] {
            if let importeTotal = Float(importe.IMPORTECAJA) {
                totalVentas += importeTotal
            } else {
                print("No se pudo convertir '\(importe.IMPORTECAJA)' a Float.")
            }
        }
        
        //Suma de la venta total de AH + Delicias
        total = totalVentas + deliciasVentasFunc()
        
        return total
    }
    
    //Funcion que trae el desgloce
    func gastosFunc() -> Float {
        var total: Float = 0.0
        
        callMethodGastos()
        
        for gasto in viewModel.gastos ?? [] {
            if let importeFinal = Float(gasto.importefinal) {
                total += importeFinal
            } else {
                print("No se pudo convertir '\(gasto.importefinal)' a Float.")
            }
        }
        
        return total
    }
    
    //Funcion que muestra el total final
    func totalFinal() -> Float {
        return Float(totalVentasFunc() - gastosFunc())
    }
    
    //Llamadas a la API
    //Metodo que llama a la API para Delicias
    func callMethodDelicias() {
        DispatchQueue.global(qos: .background).async {
            viewModel.fetchDeliciasData(date: fecha)
        }
    }
    
    func callNethodTotalVentas() {
        DispatchQueue.global(qos: .background).async {
            viewModel.fetchTotalesVentasData(date: fecha)
        }
    }
    
    func callMethodGastos(){
        DispatchQueue.global(qos: .background).async {
            viewModel.fetchGastosData(date: fecha)
        }
    }
}//End View
