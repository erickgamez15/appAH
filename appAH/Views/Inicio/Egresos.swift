//
//  Egresos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

//Vista que contiene el desgloce de los gastos
struct Egresos: View {
    
    @State var value = "88888888.80"
    @StateObject private var viewModel = ViewModel()
    var fecha: String
    
    var body: some View {
        
        Group{
            Section(
                header: Text("Salidas")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 30)
            ){
                VStack{
                    HStack{
                        Text("Total Salidas: ")
                        Text("$\(gastosFunc(), specifier: "%.5f")")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .bold()
                    .foregroundColor(.red)
                    
                    Divider() //Linea divisora
                    
                    HStack{
                        Label("Gastos: ", systemImage: "dollarsign")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Devoluciones Cancelaciones: ", systemImage: "arrow.counterclockwise")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Sueldos: ", systemImage: "person.2")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Vales: ", systemImage: "tag")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Importe de Bonificación: ", systemImage: "doc.text")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Suministros: ", systemImage: "cart")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Préstamos: ", systemImage: "calendar")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
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
    
    //Funcion que trae el desgloce
    func gastosFunc() -> Float {
        var total: Float = 0.0
        
        callMethodGastos()
        
        for gasto in viewModel.gastos ?? [] {
            if let importeFinal = Float(gasto.importefinal) {
                total += importeFinal
            } else {
                print("No se pudo convertir '\(gasto.importefinal)' a Double.")
            }
        }
        
        return total
    }
    
    func callMethodGastos(){
        DispatchQueue.global(qos: .background).async {
            viewModel.fetchGastosData(date: fecha)
        }
    }
}//End View
