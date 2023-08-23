//
//  Ingresos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

//Vista que muestra el desgloce de la Entradas
struct Ingresos: View {
    
    @State var value = "88888888.80"
    @StateObject private var viewModel = ViewModel()
    var fecha: String
    
    var body: some View {
        
        Group{
            Section(
                header: Text("Entradas")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 30)
            ){
                VStack{
                    VStack{
                        HStack{
                            Text("Total Entradas: ")
                            Text("$\(totalVentasFunc(), specifier: "%.3f")")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .bold()
                        .foregroundColor(.green)
                        
                        Divider()
                    }
                
                    HStack{
                        Label("Delicias: ", systemImage: "bag.badge.plus")
                        Text("$\(deliciasVentasFunc(), specifier: "%.3f")")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Efectivo: ", systemImage: "dollarsign")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Tarjetas: ", systemImage: "creditcard")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Créditos: ", systemImage: "percent")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Monedas: ", systemImage: "dollarsign.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Transferencia: ", systemImage: "arrow.right.arrow.left")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Cheques: ", systemImage: "doc.text")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Otros: ", systemImage: "questionmark.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Pagos de notas de otras fechas: ", systemImage: "calendar")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                }//End VStack
                .padding()
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.black)
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
    
    func callMethodDesgloce(){
        DispatchQueue.global(qos: .background).async {
            viewModel.fetchDesgloceData(date: fecha)
        }
    }
}//End View
