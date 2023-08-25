//
//  CardsTraspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI
import Foundation

struct CardsTraspasos: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var nota: String
    var solicita: String
    var docid: String
    
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
            }
            .bold()
            .foregroundColor(.cyan)
            
            Button(action: {
                viewModel.fetchTablaData(docid: docid)
                showTable.toggle()
            }) {
                Image(systemName: "chevron.down")
            }
            .bold()
            .padding(.top, 1)
            .foregroundColor(.red)
            .cornerRadius(5)
        }
        .padding()
        .padding(.horizontal)
        .font(.body)
        .fontWeight(.light)
        .background(Color.white)
        .cornerRadius(20)
        
        if showTable {
            Group{
                Section{
                    ForEach(viewModel.tabla ?? []){ tb in
                        if (docid == tb.DESDOCID){
                            Table(tableData: [("\(tb.DESCANTIDAD)", "\(tb.DESCRIPCIO)")])
                        }
                    }
                }
                .padding(.top, 1)
            }
        }
    }
    
    
}

struct Table: View{
    
    let tableData: [(cantidad: String, descripcion: String)]
    
    var body: some View {
        VStack {
            //Encabezados de la columna
            HStack {
                Text("Cantidad")
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider() //Linea divisora
                    .background(Color.black)
                Text("Descripción")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .bold()
            .font(.headline)
            
            // Filas de la tabla
            ForEach(tableData, id: \.descripcion) { data in
                Divider()
                    .background(Color.black)
                HStack {
                    Text("\(data.cantidad)")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(data.descripcion)
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
            .stroke(Color .black.opacity(0.5), lineWidth: 3))
    }
}
