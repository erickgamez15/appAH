//
//  CardsTraspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import Foundation
import SwiftUI

struct CardsTraspasos: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var nota: String
    var solicita: String
    var docid: String
    
    @State private var tableData: [(cantidad: String, unidad: String, descripcion: String)] = []
    @State private var showTable = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Nota: ")
                Text("\(nota)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .bold()
            .foregroundColor(.black)
            
            HStack {
                Text("Solicita: ")
                Text("\(solicita)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    viewModel.fetchTablaData(docid: docid)
                    tableData = viewModel.tabla?.map { tb in
                        return (cantidad: tb.DESCANTIDAD, unidad: tb.UNIDAD, descripcion: tb.DESCRIPCIO)
                    } ?? []
                    showTable.toggle()
                }) {
                    Image(systemName: "chevron.down")
                }
                .bold()
                .padding(.top, 1)
                .foregroundColor(.red)
                .cornerRadius(5)
            }
            .bold()
            .foregroundColor(.cyan)
        }
        .padding()
        .padding(.horizontal)
        .font(.body)
        .fontWeight(.light)
        .background(Color.white)
        .cornerRadius(20)
        
        if showTable {
            if let tabla = viewModel.tabla {
                Tabla(tabla: tabla)
            }
        }
    }
}

struct Tabla: View{
    
    var tabla: [TablaData]
    
    var body: some View {
        VStack {
            // Encabezados de la columna
            HStack {
                Text("Cantidad")
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                    .background(Color.black)
                Text("Descripción")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .bold()
            .font(.headline)
            
            // Filas de la tabla
            ForEach(tabla, id: \.CLAVE) { tb in
                Divider()
                    .background(Color.black)
                HStack {
                    if let cantidadDouble = Double(tb.DESCANTIDAD) {
                        Text("\(cantidadDouble, specifier: "%.3f") \(tb.UNIDAD)")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Divider()
                        .background(Color.black)
                    Text(tb.DESCRIPCIO)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding()
        .font(.body)
        .fontWeight(.light)
        .foregroundColor(.black)
        .background(Color.white)
        .overlay(Rectangle()
            .stroke(Color.black.opacity(0.5), lineWidth: 3))
    }
}
